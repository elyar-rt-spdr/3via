import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_game/features/game/game_controller.dart';
import 'package:trivia_game/features/results/results_controller.dart';
import 'package.flutter/widgets.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameControllerProvider);
    final resultsState = ref.watch(resultsControllerProvider);

    // Calculate accuracy
    final accuracy = (resultsState.correctAnswers /
            (resultsState.correctAnswers + resultsState.incorrectAnswers)) *
        100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Over'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Topic: ${resultsState.topicPlayed}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Total Score: ${gameState.totalScore}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Accuracy: ${accuracy.toStringAsFixed(2)}%',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/topic'),
                  child: const Text('Play Again'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
