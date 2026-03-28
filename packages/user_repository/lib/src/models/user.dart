import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userID;
  final String name;
  final String email;
  final int points;
  final int checkpoint;
  final int streak;
  final int bestStreak;
  final int correctGuesses;
  final int totalGuesses;
  final Map<String, int> clipSubmissionRounds;

  const MyUser({
    required this.userID,
    required this.name,
    required this.email,
    required this.points,
    required this.checkpoint,
    required this.streak,
    required this.bestStreak,
    required this.correctGuesses,
    required this.totalGuesses,
    required this.clipSubmissionRounds,
  });

  static const empty = MyUser(
    userID: '',
    name: '',
    email: '',
    points: 0,
    checkpoint: 0,
    streak: 0,
    bestStreak: 0,
    correctGuesses: 0,
    totalGuesses: 0,
    clipSubmissionRounds: {},
  );

  MyUser copyWith({
    String? userID,
    String? name,
    String? email,
    int? points,
    int? checkpoint,
    int? streak,
    int? bestStreak,
    int? correctGuesses,
    int? totalGuesses,
    Map<String, int>? clipSubmissionRounds,
  }) {
    return MyUser(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
      points: points ?? this.points,
      checkpoint: checkpoint ?? this.checkpoint,
      streak: streak ?? this.streak,
      bestStreak: bestStreak ?? this.bestStreak,
      correctGuesses: correctGuesses ?? this.correctGuesses,
      totalGuesses: totalGuesses ?? this.totalGuesses,
      clipSubmissionRounds: clipSubmissionRounds ?? this.clipSubmissionRounds,
    );
  }

  static const int levelSize = 250;

  int get level => (points ~/ levelSize) + 1;

  int get currentLevelFloor => (level - 1) * levelSize;

  int get nextLevelTarget => level * levelSize;

  double get levelProgress =>
      ((points - currentLevelFloor) / levelSize).clamp(0, 1).toDouble();

  double get accuracy => totalGuesses == 0 ? 0 : correctGuesses / totalGuesses;

  MyUserEntity toEntity() {
    return MyUserEntity(
      userID: userID,
      name: name,
      email: email,
      points: points,
      checkpoint: checkpoint,
      streak: streak,
      bestStreak: bestStreak,
      correctGuesses: correctGuesses,
      totalGuesses: totalGuesses,
      clipSubmissionRounds: clipSubmissionRounds,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userID: entity.userID,
      name: entity.name,
      email: entity.email,
      points: entity.points,
      checkpoint: entity.checkpoint,
      streak: entity.streak,
      bestStreak: entity.bestStreak,
      correctGuesses: entity.correctGuesses,
      totalGuesses: entity.totalGuesses,
      clipSubmissionRounds: entity.clipSubmissionRounds,
    );
  }

  @override
  List<Object?> get props => [
    userID,
    name,
    email,
    points,
    checkpoint,
    streak,
    bestStreak,
    correctGuesses,
    totalGuesses,
    clipSubmissionRounds,
  ];
}
