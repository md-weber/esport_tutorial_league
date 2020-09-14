import 'package:esport_tutorial_league/models/league.dart';

class LeagueController {
  List<League> leagues = [
    League(
      DateTime(2020, 6, 12),
      DateTime(2020, 9, 7),
      "assets/images/lcs.png",
      "League of Legends Championship Series",
      [],
    ),
    League(
      DateTime(2020, 6, 12),
      DateTime(2020, 9, 10),
      "assets/images/lol-ec.png",
      "European Championship",
      [],
    ),
    League(
      DateTime(2020, 8, 17),
      DateTime(2020, 9, 20),
      "assets/images/eu-masters.png",
      "European Masters",
      [],
    ),
    League(
      DateTime(2020, 8, 28),
      DateTime(2020, 9, 7),
      "assets/images/champions-korea.png",
      "League of Legends Champions Korea",
      [],
    )
  ];

  Future<List<League>> get pastLeagues async => leagues
      .where((element) => DateTime.now().isAfter(element.endEvent))
      .toList();

  Future<List<League>> get currentLeagues async => leagues
      .where((element) =>
          element.beginEvent.isBefore(DateTime.now()) &&
          element.endEvent.isAfter(DateTime.now()))
      .toList();

  Future<List<League>> get upcomingLeagues async => leagues
      .where(
        (element) => DateTime.now().isBefore(element.beginEvent),
      )
      .toList();
}
