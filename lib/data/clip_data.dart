import 'package:flutter/services.dart';

class Clip {
  final String id;
  final String videoPath;
  final String prompt;
  final String solution;
  final List<String> acceptedTitles;
  final List<String> answers;
  final int points;

  const Clip({
    required this.id,
    required this.videoPath,
    required this.prompt,
    required this.solution,
    this.acceptedTitles = const [],
    required this.answers,
    required this.points,
  });
}

const List<String> _samplePrompts = [
  'Guess the movie from the clip',
  'Name the title or a strong keyword',
  'What movie or show is this scene from?',
  'Guess the title before the clip loops',
];

final RegExp _clipAssetPattern = RegExp(r'^assets/videos/Clip(\d+)\.mp4$');

final List<Clip> sampleClips = List<Clip>.unmodifiable(
  _buildSampleClips(const [1, 2, 3, 4]),
);

Future<List<Clip>> loadSampleClips() async {
  try {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final clipNumbers =
        manifest
            .listAssets()
            .map((assetPath) => _clipAssetPattern.firstMatch(assetPath))
            .whereType<RegExpMatch>()
            .map((match) => int.parse(match.group(1)!))
            .toSet()
            .toList()
          ..sort();

    if (clipNumbers.isEmpty) {
      return sampleClips;
    }

    return List<Clip>.unmodifiable(_buildSampleClips(clipNumbers));
  } catch (_) {
    return sampleClips;
  }
}

List<Clip> _buildSampleClips(List<int> clipNumbers) {
  return clipNumbers.map(_buildSampleClip).toList(growable: false);
}

Clip _buildSampleClip(int clipNumber) {
  return Clip(
    id: 'clip_$clipNumber',
    videoPath: 'assets/videos/Clip$clipNumber.mp4',
    prompt: _samplePrompts[(clipNumber - 1) % _samplePrompts.length],
    solution: 'Sample Clip $clipNumber',
    acceptedTitles: ['clip $clipNumber', 'sample $clipNumber'],
    answers: [
      'sample clip $clipNumber',
      'clip $clipNumber',
      'sample $clipNumber',
      'test',
    ],
    points: 50,
  );
}
