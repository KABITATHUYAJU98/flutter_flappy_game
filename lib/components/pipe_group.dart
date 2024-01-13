import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_game/components/pipe.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef {
  //represents an object that can be freely moved around the screen rotated and scaled
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    addAll([
      Pipe(pipePosition: PipePosition.top, height: 100), //height random
      Pipe(pipePosition: PipePosition.bottom, height: 200),
    ]);
  }

  //now we need to make the pipes moveable from right side to the left side  and regenerate
  //it to the dynamic height and spacing in betweeen
  //use of update method which will come from the plan package and it requires
  //time delta which represents 1 cycle of the game

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    //1st access the game speed using Config | * with delta and then subtract from pipe position - pipe will be moving
  }
}
