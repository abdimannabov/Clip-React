import 'package:clip_react/core/game/game_logic.dart';
import 'package:clip_react/data/clip_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  const clip = Clip(
    id: 'clip_1',
    videoPath: 'assets/videos/Clip1.mp4',
    prompt: 'Guess the movie',
    solution: 'Inception',
    acceptedTitles: ['dream heist'],
    answers: ['inception', 'dream', 'nolan', 'leo'],
    points: 50,
  );

  test('checkAnswer matches normalized keywords inside longer text', () {
    expect(
      checkAnswer('That dream movie with Leonardo in it', clip.answers),
      isTrue,
    );
  });

  test('full title match awards full points and unlocks checkpoints', () {
    final user = MyUser.empty.copyWith(
      userID: 'u1',
      points: 450,
      checkpoint: 0,
    );

    final evaluation = evaluateGuess(
      user: user,
      clip: clip,
      input: 'I think this is Inception',
    );

    expect(evaluation.matchType, GuessMatchType.full);
    expect(evaluation.pointsAfter, 500);
    expect(evaluation.checkpointAfter, 500);
    expect(evaluation.updatedUser.streak, 1);
    expect(evaluation.updatedUser.clipSubmissionRounds['clip_1'], 1);
  });

  test('partial title match awards half points', () {
    const multiWordClip = Clip(
      id: 'clip_2',
      videoPath: 'assets/videos/Clip1.mp4',
      prompt: 'Guess the movie',
      solution: 'The Dark Knight',
      answers: ['batman', 'joker', 'gotham'],
      points: 50,
    );

    final evaluation = evaluateGuess(
      user: MyUser.empty.copyWith(userID: 'u1'),
      clip: multiWordClip,
      input: 'dark knight',
    );

    expect(evaluation.matchType, GuessMatchType.partial);
    expect(evaluation.pointsDelta, 25);
    expect(evaluation.updatedUser.correctGuesses, 1);
  });

  test('wrong answers cannot drop below checkpoint', () {
    final user = MyUser.empty.copyWith(
      userID: 'u1',
      points: 500,
      checkpoint: 500,
      streak: 3,
      bestStreak: 3,
    );

    final evaluation = evaluateGuess(
      user: user,
      clip: clip,
      input: 'Interstellar maybe',
    );

    expect(evaluation.isCorrect, isFalse);
    expect(evaluation.pointsAfter, 500);
    expect(evaluation.pointsDelta, 0);
    expect(evaluation.updatedUser.streak, 0);
    expect(evaluation.checkpointProtected, isTrue);
  });

  test('submitted clips stay blocked until 20 other submissions happen', () {
    final blockedUser = MyUser.empty.copyWith(
      userID: 'u1',
      totalGuesses: 8,
      clipSubmissionRounds: const {'clip_1': 5},
    );
    final unlockedUser = blockedUser.copyWith(totalGuesses: 25);

    expect(canSubmitClip(blockedUser, 'clip_1'), isFalse);
    expect(submissionsRemainingForClip(blockedUser, 'clip_1'), 17);
    expect(canSubmitClip(unlockedUser, 'clip_1'), isTrue);
    expect(submissionsRemainingForClip(unlockedUser, 'clip_1'), 0);
  });
}
