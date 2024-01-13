import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/ground.dart';
import 'package:flappy_bird_game/components/pipe_group.dart';
import 'package:flappy_bird_game/game/configuration.dart';

import '../components/bird.dart';

class FlappyBirdGame extends FlameGame {
  //create instance of bird class
  late Bird bird;

  Timer interval = Timer(Config.pipeInterval as Duration);

  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground(), bird = Bird(), PipeGroup()]);

    interval.onTick = () => add(PipeGroup());
  }
}
