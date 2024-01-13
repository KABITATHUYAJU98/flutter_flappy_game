import 'package:flame/game.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/ground.dart';

class FlappyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {

    addAll([Background(), Ground()]);
  }
}
