import 'package:flutter/material.dart';
import 'package:trivia_game/l10n/app_localizations.dart';

class AnswerResultWidget extends StatelessWidget {
  final Map<String, dynamic> result;

  const AnswerResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isCorrect = result['correct'];
    final int pointsChange = result['pointsChange'];

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
      child: Column(
        children: [
          Text(
            isCorrect ? l10n.correct : l10n.wrong,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${pointsChange > 0 ? '+' : ''}$pointsChange ${l10n.points}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
