import 'package:basic/manananggal/game/assets.dart';
import 'package:basic/manananggal/game/configuration.dart';
import 'package:basic/manananggal/game/flappymanananggal.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class Clouds extends ParallaxComponent<FlappyManananggal>
    with HasGameRef<FlappyManananggal> {
  Clouds();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load(Assets.clouds);
    position = Vector2(x, -(gameRef.size.y - Config.cloudsHeight));
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(image, fill: LayerFill.none),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
