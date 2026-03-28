import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Stream<MyUser> getMyUser(String userId);

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser myUser);

  Future<void> updateUserData(MyUser myUser);

  Future<void> signIn(String email, String password);

  Future<void> logOut();
}
