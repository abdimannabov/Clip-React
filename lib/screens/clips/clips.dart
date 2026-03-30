import 'package:clip_react/data/clip_data.dart';
import 'package:clip_react/core/game/game_logic.dart';
import 'package:clip_react/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:clip_react/screens/clips/components/clip_result_overlay.dart';
import 'package:clip_react/screens/clips/components/clip_video.dart';
import 'package:clip_react/screens/clips/components/guess_input.dart';
import 'package:clip_react/screens/clips/components/like_comment.dart';
import 'package:clip_react/widgets/current_user_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class ClipsScreen extends StatefulWidget {
  const ClipsScreen({super.key});

  @override
  State<ClipsScreen> createState() => _ClipsScreenState();
}

class _ClipsScreenState extends State<ClipsScreen> {
  static const double _clipZoomScale = 1.08;
  final PageController _controller = PageController();
  final TextEditingController _guessController = TextEditingController();
  List<Clip> _clips = sampleClips;
  int currentIndex = 0;
  bool _isSubmitting = false;
  bool _isLoadingClips = true;
  GuessEvaluation? _activeEvaluation;

  @override
  void initState() {
    super.initState();
    _loadClips();
  }

  @override
  void dispose() {
    _controller.dispose();
    _guessController.dispose();
    super.dispose();
  }

  Future<void> _loadClips() async {
    final clips = await loadSampleClips();
    if (!mounted) {
      return;
    }

    setState(() {
      _clips = clips;
      _isLoadingClips = false;
      if (currentIndex >= _clips.length) {
        currentIndex = 0;
      }
    });
  }

  void _showAlreadySubmittedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You already submitted your answer for this clip.'),
      ),
    );
  }

  Future<void> _submitGuess(MyUser user) async {
    if (_isSubmitting) {
      return;
    }

    if (_clips.isEmpty || currentIndex >= _clips.length) {
      return;
    }

    final clip = _clips[currentIndex];
    if (!canSubmitClip(user, clip.id)) {
      _showAlreadySubmittedMessage();
      return;
    }

    final guess = _guessController.text.trim();
    if (guess.isEmpty) {
      return;
    }

    final authState = context.read<AuthenticationBloc>().state;
    final firebaseUser = authState.user;
    if (firebaseUser == null) {
      return;
    }

    final normalizedUser = user.copyWith(
      userID: user.userID.isEmpty ? firebaseUser.uid : user.userID,
      email: user.email.isEmpty ? (firebaseUser.email ?? '') : user.email,
      name: user.name.isEmpty
          ? (firebaseUser.displayName ??
                firebaseUser.email?.split('@').first ??
                'Player One')
          : user.name,
    );
    final evaluation = evaluateGuess(
      user: normalizedUser,
      clip: clip,
      input: guess,
    );

    setState(() {
      _isSubmitting = true;
      _activeEvaluation = evaluation;
    });

    _guessController.clear();
    try {
      await context.read<UserRepository>().updateUserData(
        evaluation.updatedUser,
      );
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isSubmitting = false;
        _activeEvaluation = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to save progress right now.')),
      );
      return;
    }

    await Future<void>.delayed(const Duration(milliseconds: 1800));
    if (!mounted) {
      return;
    }

    setState(() {
      _activeEvaluation = null;
      _isSubmitting = false;
    });

    if (currentIndex < _clips.length - 1) {
      await _controller.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CurrentUserBuilder(
      builder: (context, user) =>
          Scaffold(backgroundColor: Colors.black, body: _buildBody(user)),
    );
  }

  Widget _buildBody(MyUser user) {
    if (_isLoadingClips) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_clips.isEmpty) {
      return const Center(
        child: Text(
          'No clips were found.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: _clips.length,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
          _activeEvaluation = null;
          _guessController.clear();
        });
      },
      itemBuilder: (context, index) {
        final clip = _clips[index];
        final isCooldownBlocked = !canSubmitClip(user, clip.id);
        final isCurrentClip = index == currentIndex;

        return Stack(
          fit: StackFit.expand,
          children: [
            ClipVideo(
              key: ValueKey(clip.id),
              path: clip.videoPath,
              isActive: isCurrentClip,
              zoomScale: _clipZoomScale,
            ),
            const Positioned(right: 20, bottom: 160, child: LikeComment()),
            Positioned(
              bottom: 80,
              right: 20,
              child: GuessInput(
                controller: _guessController,
                isEnabled:
                    isCurrentClip && !_isSubmitting && !isCooldownBlocked,
                isSubmitting: isCurrentClip && _isSubmitting,
                hintText: isCooldownBlocked
                    ? 'Already submitted your answer'
                    : 'Type your guess ...',
                submitLabel: isCooldownBlocked ? 'Done' : 'Submit',
                onLockedTap: isCurrentClip
                    ? _showAlreadySubmittedMessage
                    : null,
                onSubmit: () => _submitGuess(user),
              ),
            ),
            if (_activeEvaluation != null && isCurrentClip)
              Center(child: ClipResultOverlay(evaluation: _activeEvaluation!)),
          ],
        );
      },
    );
  }
}
