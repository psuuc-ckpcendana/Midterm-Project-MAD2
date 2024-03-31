import 'package:basic/manananggal/components/background.dart';
import 'package:basic/manananggal/components/bird.dart';
import 'package:basic/manananggal/components/ground.dart';
import 'package:basic/manananggal/components/pipe_group.dart';
import 'package:basic/manananggal/game/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FlappyManananggal extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyManananggal();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Permanent Marker', fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
