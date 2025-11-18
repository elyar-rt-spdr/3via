import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_game/common/services/auth_service.dart';
import 'package:trivia_game/l10n/app_localizations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = ref.watch(authServiceProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: l10n.email),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: l10n.password),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authService.signInWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );
              },
              child: Text(l10n.login),
            ),
            TextButton(
              onPressed: () => context.go('/register'),
              child: Text(l10n.register),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authService.signInWithGoogle();
              },
              child: Text(l10n.signInWithGoogle),
            ),
            ElevatedButton(
              onPressed: () async {
                await authService.signInWithFacebook();
              },
              child: Text(l10n.signInWithFacebook),
            ),
          ],
        ),
      ),
    );
  }
}
