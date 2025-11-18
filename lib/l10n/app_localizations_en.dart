import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AI Trivia Game';

  @override
  String get playNow => 'Play Now';

  @override
  String get chooseTopic => 'Choose a Topic';

  @override
  String get enterTopic => 'Enter any topic';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get hard => 'Hard';

  @override
  String get startGame => 'Start Game';

  @override
  String get question => 'Question';

  @override
  String get submitAnswer => 'Submit Answer';

  @override
  String get confidenceMultiplier => 'Confidence Multiplier';

  @override
  String get correct => 'Correct!';

  @override
  String get wrong => 'Wrong!';

  @override
  String get points => 'points';

  @override
  String get gameOver => 'Game Over';

  @override
  String get topic => 'Topic';

  @override
  String get totalScore => 'Total Score';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get playAgain => 'Play Again';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get logout => 'Logout';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signInWithFacebook => 'Sign in with Facebook';
}
