import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_game/common/services/api_service.dart';
import 'package:trivia_game/features/game/game_controller.dart';

// State for the topic selection screen
class TopicState {
  final String topic;
  final String difficulty;

  TopicState({this.topic = '', this.difficulty = 'easy'});

  TopicState copyWith({String? topic, String? difficulty}) {
    return TopicState(
      topic: topic ?? this.topic,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}

// Controller for the topic selection logic
class TopicController extends StateNotifier<TopicState> {
  final Ref _ref;

  TopicController(this._ref) : super(TopicState());

  void setTopic(String topic) {
    state = state.copyWith(topic: topic);
  }

  void setDifficulty(String difficulty) {
    state = state.copyWith(difficulty: difficulty);
  }

  Future<void> startGame() async {
    final apiService = _ref.read(apiServiceProvider);
    try {
      final gameSession = await apiService.startGame(
        topic: state.topic,
        difficulty: state.difficulty,
      );
      // Set the game session in the GameController
      _ref.read(gameControllerProvider.notifier).setGameSession(gameSession);
    } catch (e) {
      // Handle error, e.g., show a snackbar
      print('Failed to start game: $e');
    }
  }
}

// Provider for the TopicController
final topicControllerProvider =
    StateNotifierProvider<TopicController, TopicState>((ref) {
  return TopicController(ref);
});
