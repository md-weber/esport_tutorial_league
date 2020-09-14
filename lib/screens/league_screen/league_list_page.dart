import 'package:esport_tutorial_league/models/league.dart';
import 'package:esport_tutorial_league/screens/league_screen/league_card.dart';
import 'package:flutter/material.dart';

class LeagueListPage extends StatelessWidget {
  final Future<List<League>> leagues;

  const LeagueListPage({Key key, this.leagues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: leagues,
      builder: (context, AsyncSnapshot<List<League>> snapshot) {
        if (snapshot.hasData)
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 24),
            itemBuilder: (context, index) =>
                LeagueCard(league: snapshot.data[index]),
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: snapshot.data.length,
          );

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
