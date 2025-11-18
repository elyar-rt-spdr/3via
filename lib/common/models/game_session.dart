import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_game/common/models/question.dart';

part 'game_session.freezed.dart';
part 'game_session.g.dart';

@freezed
class GameSession with _$GameSession {
  const factory GameSession({
    required String sessionId,
    required List<Question> questions,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, dynamic> json) =>
      _$GameSessionFromJson(json);
}
