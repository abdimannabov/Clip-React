import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
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

  const MyUserEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'points': points,
      'checkpoint': checkpoint,
      'streak': streak,
      'bestStreak': bestStreak,
      'correctGuesses': correctGuesses,
      'totalGuesses': totalGuesses,
      'clipSubmissionRounds': clipSubmissionRounds,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userID: doc['userID'] ?? '',
      name: doc['name'] ?? '',
      email: doc['email'] ?? '',
      points: _readInt(doc['points']),
      checkpoint: _readInt(doc['checkpoint']),
      streak: _readInt(doc['streak']),
      bestStreak: _readInt(doc['bestStreak']),
      correctGuesses: _readInt(doc['correctGuesses']),
      totalGuesses: _readInt(doc['totalGuesses']),
      clipSubmissionRounds: _readIntMap(doc['clipSubmissionRounds']),
    );
  }

  static int _readInt(Object? value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    return 0;
  }

  static Map<String, int> _readIntMap(Object? value) {
    if (value is! Map) {
      return const {};
    }

    final result = <String, int>{};
    for (final entry in value.entries) {
      result[entry.key.toString()] = _readInt(entry.value);
    }
    return result;
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
