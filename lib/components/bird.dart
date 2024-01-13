import 'package:flame/components.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/bird_movement.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  //to gain access to the gam rep property which will help to load the Sprite
//as we are extending the class with the Sprite group component
  Bird();

  @override
  Future<void> onLoad() async {
    //to load the specified image with the file name
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

    size = Vector2(50, 40);
    //there are 3 movements but we set ..current movement as the middle
    position = Vector2(50, gameRef.size.y / 2 - size.y/2); //to get center point and also subtract the height of the bird
    

    current = BirdMovement.middle;
    sprites = {
      //1st we check if the state is middle then..we set it to midFlap and so on
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap
    };
  }
}
