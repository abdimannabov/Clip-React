import 'dart:math';

import 'package:clip_react/data/clip_data.dart';
import 'package:user_repository/user_repository.dart';

const int wrongGuessPenalty = 10;
const int checkpointInterval = 500;
const int clipResubmitCooldown = 20;

enum GuessMatchType { full, partial, incorrect }

class GuessEvaluation {
  final Clip clip;
  final GuessMatchType matchType;
  final int pointsDelta;
  final int pointsBefore;
  final int pointsAfter;
  final int checkpointBefore;
  final int checkpointAfter;
  final MyUser updatedUser;

  const GuessEvaluation({
    required this.clip,
    required this.matchType,
    required this.pointsDelta,
    required this.pointsBefore,
    required this.pointsAfter,
    required this.checkpointBefore,
    required this.checkpointAfter,
    required this.updatedUser,
  });

  bool get isCorrect => matchType != GuessMatchType.incorrect;

  bool get isFullMatch => matchType == GuessMatchType.full;

  bool get isPartialMatch => matchType == GuessMatchType.partial;

  bool get checkpointUnlocked => checkpointAfter > checkpointBefore;

  bool get checkpointProtected =>
      matchType == GuessMatchType.incorrect &&
      checkpointAfter > 0 &&
      pointsAfter == checkpointAfter;
}

String normalizeGuess(String input) {
  return input
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9\s]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

bool checkAnswer(String input, List<String> answers) {
  return answers.any(
    (answer) => _containsPhrase(normalizeGuess(input), answer),
  );
}

int calculateCheckpoint(int points) {
  return (points ~/ checkpointInterval) * checkpointInterval;
}

bool canSubmitClip(MyUser user, String clipId) {
  return submissionsRemainingForClip(user, clipId) == 0;
}

int submissionsRemainingForClip(MyUser user, String clipId) {
  final lastRound = user.clipSubmissionRounds[clipId];
  if (lastRound == null) {
    return 0;
  }

  final completedSinceLastSubmission = user.totalGuesses - lastRound;
  final remaining = clipResubmitCooldown - completedSinceLastSubmission;
  return remaining < 0 ? 0 : remaining;
}

GuessMatchType classifyGuess({required String input, required Clip clip}) {
  final normalized = normalizeGuess(input);
  if (normalized.isEmpty) {
    return GuessMatchType.incorrect;
  }

  final fullCandidates = [clip.solution, ...clip.acceptedTitles];
  for (final candidate in fullCandidates) {
    if (_containsPhrase(normalized, candidate)) {
      return GuessMatchType.full;
    }
  }

  for (final candidate in fullCandidates) {
    if (_isTitleFragmentMatch(normalized, candidate)) {
      return GuessMatchType.partial;
    }
  }

  for (final answer in clip.answers) {
    if (_containsPhrase(normalized, answer)) {
      return GuessMatchType.partial;
    }
  }

  return GuessMatchType.incorrect;
}

GuessEvaluation evaluateGuess({
  required MyUser user,
  required Clip clip,
  required String input,
}) {
  final matchType = classifyGuess(input: input, clip: clip);
  final pointsBefore = user.points;
  final checkpointBefore = user.checkpoint;
  final isCorrect = matchType != GuessMatchType.incorrect;
  final awardedPoints = switch (matchType) {
    GuessMatchType.full => clip.points,
    GuessMatchType.partial => (clip.points / 2).round(),
    GuessMatchType.incorrect => -wrongGuessPenalty,
  };

  var nextPoints = pointsBefore + awardedPoints;
  nextPoints = max(nextPoints, 0);

  var nextCheckpoint = checkpointBefore;

  if (isCorrect) {
    nextCheckpoint = max(checkpointBefore, calculateCheckpoint(nextPoints));
  }

  if (!isCorrect && nextPoints < checkpointBefore) {
    nextPoints = checkpointBefore;
  }

  final nextStreak = isCorrect ? user.streak + 1 : 0;
  final nextSubmissionRound = user.totalGuesses + 1;
  final nextClipSubmissionRounds = Map<String, int>.from(
    user.clipSubmissionRounds,
  )..[clip.id] = nextSubmissionRound;
  final updatedUser = user.copyWith(
    points: nextPoints,
    checkpoint: nextCheckpoint,
    streak: nextStreak,
    bestStreak: max(user.bestStreak, nextStreak),
    correctGuesses: user.correctGuesses + (isCorrect ? 1 : 0),
    totalGuesses: nextSubmissionRound,
    clipSubmissionRounds: nextClipSubmissionRounds,
  );

  return GuessEvaluation(
    clip: clip,
    matchType: matchType,
    pointsDelta: nextPoints - pointsBefore,
    pointsBefore: pointsBefore,
    pointsAfter: nextPoints,
    checkpointBefore: checkpointBefore,
    checkpointAfter: nextCheckpoint,
    updatedUser: updatedUser,
  );
}

bool _containsPhrase(String normalizedInput, String candidate) {
  final normalizedCandidate = normalizeGuess(candidate);
  return normalizedCandidate.isNotEmpty &&
      normalizedInput.contains(normalizedCandidate);
}

bool _isTitleFragmentMatch(String normalizedInput, String candidate) {
  final normalizedCandidate = normalizeGuess(candidate);
  if (normalizedCandidate.isEmpty || normalizedInput == normalizedCandidate) {
    return false;
  }

  if (normalizedCandidate.contains(normalizedInput) &&
      normalizedInput.length >= 4) {
    return true;
  }

  final inputTokens = _significantTokens(normalizedInput);
  final candidateTokens = _significantTokens(normalizedCandidate);

  if (inputTokens.isEmpty || candidateTokens.isEmpty) {
    return false;
  }

  final matchedTokens = inputTokens.where(candidateTokens.contains).toSet();
  if (matchedTokens.isEmpty) {
    return false;
  }

  if (candidateTokens.length == 1) {
    return matchedTokens.first.length >= 4;
  }

  return matchedTokens.length >= 2;
}

Set<String> _significantTokens(String value) {
  const ignoredWords = {
    'a',
    'an',
    'and',
    'the',
    'of',
    'to',
    'for',
    'in',
    'on',
    'at',
    'with',
  };

  return value
      .split(' ')
      .where((token) => token.length >= 3 && !ignoredWords.contains(token))
      .toSet();
}
