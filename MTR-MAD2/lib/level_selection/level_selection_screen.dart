import 'package:basic/manananggal/game/flappymanananggal.dart';
import 'package:basic/manananggal/screens/game_over_screen.dart';
import 'package:basic/manananggal/screens/main_menu_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenForGame extends StatelessWidget {
   ScreenForGame({super.key});

  final game = FlappyManananggal();

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    );
  }
}