import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_game/features/game/game_controller.dart';
import 'package:trivia_game/features/topic_selection/topic_controller.dart';

// State for the results screen
class ResultsState {
  final int correctAnswers;
  final int incorrectAnswers;
  final String topicPlayed;

  ResultsState({
    this.correctAnswers = 0,
    this.incorrectAnswers = 0,
    this.topicPlayed = '',
  });

  ResultsState copyWith({
    int? correctAnswers,
    int? incorrectAnswers,
    String? topicPlayed,
  }) {
    return ResultsState(
      correctAnswers: correctAnswers ?? this.correctAnswers,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      topicPlayed: topicPlayed ?? this.topicPlayed,
    );
  }
}

// Controller for the results logic
class ResultsController extends StateNotifier<ResultsState> {
  final Ref _ref;

  ResultsController(this._ref) : super(ResultsState()) {
    _initialize();
  }

  void _initialize() {
    final gameState = _ref.read(gameControllerProvider);
    final topicState = _ref.read(topicControllerProvider);

    int correct = 0;
    // This is a simplification. In a real app, you'd get this from the API
    // or track it more accurately in the GameController.
    gameState.questions.forEach((question) {
      if (question.correctAnswer == 'user_answer_placeholder') {
        correct++;
      }
    });

    state = state.copyWith(
      correctAnswers: correct,
      incorrectAnswers: gameState.questions.length - correct,
      topicPlayed: topicState.topic,
    );
  }
}

// Provider for the ResultsController
final resultsControllerProvider =
    StateNotifierProvider<ResultsController, ResultsState>((ref) {
  return ResultsController(ref);
});
