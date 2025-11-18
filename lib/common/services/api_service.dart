import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_game/common/models/game_session.dart';
import 'package:trivia_game/common/models/question.dart';

const baseUrl = String.fromEnvironment("API_URL");

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: baseUrl));
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<GameSession> startGame({
    required String topic,
    required String difficulty,
  }) async {
    final response = await _dio.post(
      '/api/start-game',
      data: {
        'topic': topic,
        'difficulty': difficulty,
      },
    );
    return GameSession.fromJson(response.data);
  }

  Future<Map<String, dynamic>> submitAnswer({
    required String sessionId,
    required String questionId,
    required String answer,
    required double multiplier,
  }) async {
    final response = await _dio.post(
      '/api/answer',
      data: {
        'sessionId': sessionId,
        'questionId': questionId,
        'answer': answer,
        'multiplier': multiplier,
      },
    );
    return response.data;
  }
}
