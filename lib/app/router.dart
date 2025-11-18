import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_game/common/services/auth_service.dart';
import 'package:trivia_game/features/auth/login_screen.dart';
import 'package:trivia_game/features/auth/register_screen.dart';
import 'package:trivia_game/features/home/home_screen.dart';
import 'package:trivia_game/features/topic_selection/topic_screen.dart';
import 'package:trivia_game/features/game/game_screen.dart';
import 'package:trivia_game/features/results/results_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/topic',
        builder: (context, state) => const TopicScreen(),
      ),
      GoRoute(
        path: '/game',
        builder: (context, state) => const GameScreen(),
      ),
      GoRoute(
        path: '/results',
        builder: (context, state) => const ResultsScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    redirect: (context, state) {
      final loggedIn = authState.asData?.value != null;
      final loggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';

      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }

      if (loggingIn) {
        return '/';
      }

      return null;
    },
  );
});
