import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_game/common/services/auth_service.dart';
import 'package:trivia_game/common/services/settings_service.dart';
import 'package:trivia_game/l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final authService = ref.watch(authServiceProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!', // This is not in the arb file, so I'll leave it as is.
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/topic');
              },
              child: Text(l10n.playNow),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: locale.languageCode,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Español')),
                DropdownMenuItem(value: 'pt', child: Text('Português')),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref.read(localeProvider.notifier).state = Locale(value);
                  ref.read(settingsServiceProvider).setLanguage(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
