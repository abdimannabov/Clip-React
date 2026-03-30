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

class _ClipDefinition {
  final String title;
  final List<String> acceptedTitles;
  final List<String> keywords;

  const _ClipDefinition.movie(
    this.title, {
    this.acceptedTitles = const [],
    this.keywords = const [],
  });

  factory _ClipDefinition.fallback(int clipNumber) {
    return _ClipDefinition.movie(
      'Sample Clip $clipNumber',
      acceptedTitles: ['clip $clipNumber', 'sample $clipNumber'],
      keywords: ['clip $clipNumber', 'sample $clipNumber'],
    );
  }

  Clip toClip({required int clipNumber, required String prompt}) {
    return Clip(
      id: 'clip_$clipNumber',
      videoPath: 'assets/videos/Clip$clipNumber.mp4',
      prompt: prompt,
      solution: title,
      acceptedTitles: acceptedTitles,
      answers: [title, ...acceptedTitles, ...keywords],
      points: 50,
    );
  }
}

const Map<int, _ClipDefinition> _clipDefinitions = {
  1: _ClipDefinition.movie('One Piece', keywords: ['luffy', 'straw hat']),
  2: _ClipDefinition.movie('Moonfall', keywords: ['moon']),
  3: _ClipDefinition.movie(
    'Doctor Strange In The Multiverse of Madness',
    keywords: ['doctor strange', 'multiverse of madness', 'strange'],
  ),
  4: _ClipDefinition.movie(
    'Doctor Strange In The Multiverse of Madness',
    keywords: ['doctor strange', 'multiverse of madness', 'strange'],
  ),
  5: _ClipDefinition.movie(
    'Doctor Strange In The Multiverse of Madness',
    keywords: ['doctor strange', 'multiverse of madness', 'strange'],
  ),
  6: _ClipDefinition.movie('Uncharted', keywords: ['nathan drake', 'drake']),
  7: _ClipDefinition.movie(
    'The Batman',
    keywords: ['batman', 'bruce wayne', 'gotham'],
  ),
  8: _ClipDefinition.movie(
    'The Batman',
    keywords: ['batman', 'bruce wayne', 'gotham'],
  ),
  9: _ClipDefinition.movie('Death On The Nile', keywords: ['nile', 'poirot']),
  10: _ClipDefinition.movie('The Northman', keywords: ['northman', 'amleth']),
  11: _ClipDefinition.movie('The Northman', keywords: ['northman', 'amleth']),
  12: _ClipDefinition.movie('The Northman', keywords: ['northman', 'amleth']),
  13: _ClipDefinition.movie('See For Me', keywords: ['blind', 'house sitter']),
  14: _ClipDefinition.movie('See For Me', keywords: ['blind', 'house sitter']),
  15: _ClipDefinition.movie(
    'You Won\'t Be Alone',
    keywords: ['wont be alone', 'alone'],
  ),
  16: _ClipDefinition.movie(
    'You Won\'t Be Alone',
    keywords: ['wont be alone', 'alone'],
  ),
  17: _ClipDefinition.movie('Kill Clause', keywords: ['clause']),
  18: _ClipDefinition.movie('Kill Clause', keywords: ['clause']),
};

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
  final clipDefinition =
      _clipDefinitions[clipNumber] ?? _ClipDefinition.fallback(clipNumber);

  return clipDefinition.toClip(
    clipNumber: clipNumber,
    prompt: _samplePrompts[(clipNumber - 1) % _samplePrompts.length],
  );
}
