import 'package:clip_react/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

typedef CurrentUserWidgetBuilder =
    Widget Function(BuildContext context, MyUser user);

class CurrentUserBuilder extends StatelessWidget {
  final CurrentUserWidgetBuilder builder;

  const CurrentUserBuilder({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = _maybeRead<AuthenticationBloc>(context);
    final userRepository = _maybeRead<UserRepository>(context);
    final firebaseUser = authBloc?.state.user;

    if (authBloc == null || userRepository == null || firebaseUser == null) {
      return builder(context, MyUser.empty.copyWith(name: 'Player One'));
    }

    return StreamBuilder<MyUser>(
      stream: userRepository.getMyUser(firebaseUser.uid),
      builder: (context, snapshot) {
        final fallbackName = firebaseUser.displayName?.trim().isNotEmpty == true
            ? firebaseUser.displayName!
            : (firebaseUser.email?.split('@').first ?? 'Player One');

        final user =
            snapshot.data ??
            MyUser.empty.copyWith(
              userID: firebaseUser.uid,
              email: firebaseUser.email ?? '',
              name: fallbackName,
            );

        return builder(context, user);
      },
    );
  }

  T? _maybeRead<T>(BuildContext context) {
    try {
      return context.read<T>();
    } catch (_) {
      return null;
    }
  }
}
