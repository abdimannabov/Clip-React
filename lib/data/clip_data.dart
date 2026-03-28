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

const sampleClips = [
  // Replace these placeholder answers/prompts with your real asset clip data.
  Clip(
    id: 'clip_1',
    videoPath: 'assets/videos/Clip1.mp4',
    prompt: 'Guess the movie from the clip',
    solution: 'Sample Clip 1',
    acceptedTitles: ['sample one'],
    answers: ['sample clip 1', 'clip one', 'test'],
    points: 50,
  ),
  Clip(
    id: 'clip_2',
    videoPath: 'assets/videos/Clip1.mp4',
    prompt: 'Name the title or a strong keyword',
    solution: 'Sample Clip 2',
    acceptedTitles: ['sample two'],
    answers: ['sample clip 2', 'clip two', 'test'],
    points: 50,
  ),
  Clip(
    id: 'clip_3',
    videoPath: 'assets/videos/Clip1.mp4',
    prompt: 'What movie or show is this scene from?',
    solution: 'Sample Clip 3',
    acceptedTitles: ['sample three'],
    answers: ['sample clip 3', 'clip three', 'test'],
    points: 50,
  ),
  Clip(
    id: 'clip_4',
    videoPath: 'assets/videos/Clip1.mp4',
    prompt: 'Guess the title before the clip loops',
    solution: 'Sample Clip 4',
    acceptedTitles: ['sample four'],
    answers: ['sample clip 4', 'clip four', 'test'],
    points: 50,
  ),
];
