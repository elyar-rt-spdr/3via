import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsServiceProvider = Provider<SettingsService>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider).asData!.value;
  return SettingsService(sharedPrefs);
});

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());

final localeProvider = StateProvider<Locale>((ref) {
  final settingsService = ref.watch(settingsServiceProvider);
  return Locale(settingsService.getLanguage());
});

class SettingsService {
  final SharedPreferences _prefs;

  SettingsService(this._prefs);

  static const String _languageCodeKey = 'languageCode';

  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString(_languageCodeKey, languageCode);
  }

  String getLanguage() {
    return _prefs.getString(_languageCodeKey) ?? 'es'; // Default to Spanish
  }
}
