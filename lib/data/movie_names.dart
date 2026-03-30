class _ClipDefinition {
  final String solution;
  final List<String> acceptedTitles;
  final List<String> answers;
  final int points;

  const _ClipDefinition({
    required this.solution,
    this.acceptedTitles = const [],
    this.answers = const [],
    this.points = 50,
  });
}

const Map<int, _ClipDefinition> _clipDefinitions = {
  1: _ClipDefinition(
    solution: 'One Piece',
    answers: ['one piece', 'luffy', 'straw hat'],
  ),
  2: _ClipDefinition(solution: 'Moonfall', answers: ['moonfall', 'moon']),
  3: _ClipDefinition(
    solution: 'Doctor Strange In The Multiverse of Madness',
    answers: ['doctor strange', 'multiverse of madness', 'strange'],
  ),
  4: _ClipDefinition(
    solution: 'Uncharted',
    answers: ['uncharted', 'nathan drake', 'drake'],
  ),
  5: _ClipDefinition(
    solution: 'The Batman',
    answers: ['the batman', 'batman', 'bruce wayne', 'gotham'],
  ),
  6: _ClipDefinition(
    solution: 'Death On The Nile',
    answers: ['death on the nile', 'nile', 'poirot'],
  ),
  7: _ClipDefinition(
    solution: 'The Northman',
    answers: ['the northman', 'northman', 'amleth'],
  ),
  8: _ClipDefinition(
    solution: 'See For Me',
    answers: ['see for me', 'blind', 'house sitter'],
  ),
  9: _ClipDefinition(
    solution: 'You Won\'t Be Alone',
    answers: ['you won t be alone', 'wont be alone', 'alone'],
  ),
  10: _ClipDefinition(
    solution: 'Kill Clause',
    answers: ['kill clause', 'clause'],
  ),
};
