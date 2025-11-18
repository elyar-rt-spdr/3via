import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:trivia_game/common/services/ads_service.dart';
import 'package:trivia_game/features/game/game_controller.dart';
import 'package:trivia_game/features/game/widgets/answer_result_widget.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    final adsService = ref.read(adsServiceProvider);
    _bannerAd = BannerAd(
      adUnitId: adsService.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameControllerProvider);
    final controller = ref.read(gameControllerProvider.notifier);
    final currentQuestion = state.questions.isEmpty
        ? null
        : state.questions[state.currentQuestionIndex];

    ref.listen<GameState>(gameControllerProvider, (previous, next) {
      if (next.gameFinished) {
        // Navigate to results screen when the game is finished
        context.go('/results');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${state.currentQuestionIndex + 1}'),
        automaticallyImplyLeading: false,
      ),
      body: currentQuestion == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...currentQuestion.answers.map(
                    (answer) => RadioListTile<String>(
                      title: Text(answer),
                      value: answer,
                      groupValue: state.selectedAnswer,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectAnswer(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Confidence Multiplier:',
                      textAlign: TextAlign.center),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [0.5, 1.0, 2.0, 4.0].map((multiplier) {
                      return ChoiceChip(
                        label: Text('x$multiplier'),
                        selected: state.multiplier == multiplier,
                        onSelected: (selected) {
                          if (selected) {
                            controller.setMultiplier(multiplier);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state.selectedAnswer == null
                        ? null
                        : () => controller.submitAnswer(),
                    child: const Text('Submit Answer'),
                  ),
                  if (state.answerResult != null)
                    AnswerResultWidget(result: state.answerResult!),
                ],
              ),
            ),
      bottomNavigationBar: _bannerAd == null
          ? null
          : SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
    );
  }
}
