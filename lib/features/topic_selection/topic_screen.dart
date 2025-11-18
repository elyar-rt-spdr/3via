import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_game/features/topic_selection/topic_controller.dart';

class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topicControllerProvider);
    final controller = ref.read(topicControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Topic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.setTopic(value),
              decoration: const InputDecoration(
                labelText: 'Enter any topic',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: state.difficulty,
              items: ['easy', 'medium', 'hard']
                  .map((difficulty) => DropdownMenuItem(
                        value: difficulty,
                        child: Text(difficulty),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.setDifficulty(value);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Difficulty',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: state.topic.isEmpty
                  ? null
                  : () {
                      controller.startGame().then((_) {
                        context.go('/game');
                      });
                    },
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
