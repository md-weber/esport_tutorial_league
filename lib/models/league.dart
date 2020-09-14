import 'package:esport_tutorial_league/models/game.dart';

class League {
  final DateTime beginEvent;
  final DateTime endEvent;
  final String backgroundImage;
  final String title;
  final List<Game> games;

  League(this.beginEvent, this.endEvent, this.backgroundImage, this.title,
      this.games);
}
