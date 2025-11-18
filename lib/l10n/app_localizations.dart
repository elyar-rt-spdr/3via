// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending them to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt', 'BR')
  ];

  /// The title of the application.
  ///
  /// In en, this message translates to:
  /// **'AI Trivia Game'**
  String get appTitle;

  /// A message displayed on a button to start playing the game.
  ///
  /// In en, this message translates to:
  /// **'Play Now'**
  String get playNow;

  /// A message displayed as the title of the topic selection screen.
  ///
  /// In en, this message translates to:
  /// **'Choose a Topic'**
  String get chooseTopic;

  /// A message displayed as a hint in a text field for entering a topic.
  ///
  /// In en, this message translates to:
  /// **'Enter any topic'**
  String get enterTopic;

  /// A message displayed as a label for the difficulty selection.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// The easy difficulty level.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// The medium difficulty level.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// The hard difficulty level.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// A message displayed on a button to start the game.
  ///
  /// In en, this message translates to:
  /// **'Start Game'**
  String get startGame;

  /// A message displayed as the title of the question screen.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// A message displayed on a button to submit an answer.
  ///
  /// In en, this message translates to:
  /// **'Submit Answer'**
  String get submitAnswer;

  /// A message displayed as a label for the confidence multiplier.
  ///
  /// In en, this message translates to:
  /// **'Confidence Multiplier'**
  String get confidenceMultiplier;

  /// A message displayed when the user's answer is correct.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get correct;

  /// A message displayed when the user's answer is wrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong!'**
  String get wrong;

  /// A message displayed to show the points gained or lost.
  ///
  /// In en, this message translates to:
  /// **'points'**
  String get points;

  /// A message displayed on the results screen when the game is over.
  ///
  /// In en, this message translates to:
  ///**'Game Over'**
  String get gameOver;

  /// A message displayed as a label for the topic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get topic;

  /// A message displayed as a label for the total score.
  ///
  /// In en, this message translates to:
  /// **'Total Score'**
  String get totalScore;

  /// A message displayed as a label for the accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// A message displayed on a button to play the game again.
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// A message displayed on a button to go back to the home screen.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// A message displayed on a button to log in.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// A message displayed on a button to register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// A message displayed on a button to log out.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// A message displayed as a label for the email field.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// A message displayed as a label for the password field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// A message displayed on a button to sign in with Google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// A message displayed on a button to sign in with Facebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get signInWithFacebook;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub.'
  );
}
