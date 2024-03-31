
import 'package:basic/manananggal/game/assets.dart';
import 'package:basic/manananggal/game/flappymanananggal.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyManananggal game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black38,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${game.bird.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: 'Permanent Marker'
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(Assets.gameOver),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Permanent Marker'),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Return to Home Screen',
                  style: TextStyle(fontSize: 20, color: Colors.red, fontFamily: 'Permanent Marker'),
                ),
                
              ),
            ],
          ),
        ),
      );

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
