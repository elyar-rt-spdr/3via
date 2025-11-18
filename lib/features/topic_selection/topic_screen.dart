import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_game/features/topic_selection/topic_controller.dart';
import 'package:trivia_game/l10n/app_localizations.dart';

class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(topicControllerProvider);
    final controller = ref.read(topicControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chooseTopic),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.setTopic(value),
              decoration: InputDecoration(
                labelText: l10n.enterTopic,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: state.difficulty,
              items: [
                DropdownMenuItem(value: 'easy', child: Text(l10n.easy)),
                DropdownMenuItem(value: 'medium', child: Text(l10n.medium)),
                DropdownMenuItem(value: 'hard', child: Text(l10n.hard)),
              ],
              onChanged: (value) {
                if (value != null) {
                  controller.setDifficulty(value);
                }
              },
              decoration: InputDecoration(
                labelText: l10n.difficulty,
                border: const OutlineInputBorder(),
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
              child: Text(l10n.startGame),
            ),
          ],
        ),
      ),
    );
  }
}
