import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_game/features/game/game_controller.dart';
import 'package:trivia_game/features/results/results_controller.dart';
import 'package:trivia_game/l10n/app_localizations.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final gameState = ref.watch(gameControllerProvider);
    final resultsState = ref.watch(resultsControllerProvider);

    // Calculate accuracy, avoiding division by zero
    final totalQuestions =
        resultsState.correctAnswers + resultsState.incorrectAnswers;
    final accuracy = totalQuestions > 0
        ? (resultsState.correctAnswers / totalQuestions) * 100
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.gameOver),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${l10n.topic}: ${resultsState.topicPlayed}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('${l10n.totalScore}: ${gameState.totalScore}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('${l10n.accuracy}: ${accuracy.toStringAsFixed(2)}%',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/topic'),
                  child: Text(l10n.playAgain),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: Text(l10n.backToHome),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
