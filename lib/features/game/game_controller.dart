import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_game/common/models/game_session.dart';
import 'package:trivia_game/common/models/question.dart';
import 'package:trivia_game/common/services/api_service.dart';
import 'package:trivia_game/common/services/ads_service.dart';

// State for the game screen
class GameState {
  final String sessionId;
  final List<Question> questions;
  final int currentQuestionIndex;
  final int totalScore;
  final String? selectedAnswer;
  final double multiplier;
  final Map<String, dynamic>? answerResult;
  final bool gameFinished;

  GameState({
    this.sessionId = '',
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.totalScore = 0,
    this.selectedAnswer,
    this.multiplier = 1.0,
    this.answerResult,
    this.gameFinished = false,
  });

  GameState copyWith({
    String? sessionId,
    List<Question>? questions,
    int? currentQuestionIndex,
    int? totalScore,
    String? selectedAnswer,
    double? multiplier,
    Map<String, dynamic>? answerResult,
    bool? gameFinished,
  }) {
    return GameState(
      sessionId: sessionId ?? this.sessionId,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      totalScore: totalScore ?? this.totalScore,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      multiplier: multiplier ?? this.multiplier,
      answerResult: answerResult ?? this.answerResult,
      gameFinished: gameFinished ?? this.gameFinished,
    );
  }
}

// Controller for the game logic
class GameController extends StateNotifier<GameState> {
  final Ref _ref;

  GameController(this._ref) : super(GameState());

  void setGameSession(GameSession session) {
    state = state.copyWith(
      sessionId: session.sessionId,
      questions: session.questions,
      currentQuestionIndex: 0,
      totalScore: 0,
      selectedAnswer: null,
      multiplier: 1.0,
      answerResult: null,
      gameFinished: false,
    );
  }

  void selectAnswer(String answer) {
    state = state.copyWith(selectedAnswer: answer);
  }

  void setMultiplier(double multiplier) {
    state = state.copyWith(multiplier: multiplier);
  }

  Future<void> submitAnswer() async {
    final apiService = _ref.read(apiServiceProvider);
    final adsService = _ref.read(adsServiceProvider);

    try {
      final result = await apiService.submitAnswer(
        sessionId: state.sessionId,
        questionId: state.questions[state.currentQuestionIndex].id,
        answer: state.selectedAnswer!,
        multiplier: state.multiplier,
      );

      state = state.copyWith(
        answerResult: result,
        totalScore: state.totalScore + (result['pointsChange'] as int),
      );

      // Show interstitial ad every 3 questions
      if ((state.currentQuestionIndex + 1) % 3 == 0) {
        adsService.showInterstitialAd();
      }

      await Future.delayed(const Duration(seconds: 2)); // Show result for 2s

      if (result['nextQuestion'] != null) {
        final nextQuestion = Question.fromJson(result['nextQuestion']);
        final newQuestions = List<Question>.from(state.questions);
        newQuestions[state.currentQuestionIndex + 1] = nextQuestion;

        state = state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex + 1,
          selectedAnswer: null,
          answerResult: null,
          questions: newQuestions,
        );
      } else {
        // No next question, game is finished
        state = state.copyWith(gameFinished: true);
      }
    } catch (e) {
      // Handle error
      print('Failed to submit answer: $e');
    }
  }
}

// Provider for the GameController
final gameControllerProvider =
    StateNotifierProvider<GameController, GameState>((ref) {
  return GameController(ref);
});
