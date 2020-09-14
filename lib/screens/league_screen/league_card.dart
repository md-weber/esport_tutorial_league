import 'dart:ui';

import 'package:esport_tutorial_league/models/league.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeagueCard extends StatelessWidget {
  final League league;

  const LeagueCard({Key key, this.league}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
              image: AssetImage(league.backgroundImage),
              fit: BoxFit.cover,
            )),
        child: LayoutBuilder(
          builder: (context, constraints) => Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: constraints.maxHeight / 3.5,
              margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                  color: const Color(0xFF000000).withOpacity(0.4),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(league.title),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getBeginToEndDate(),
                                  style: TextStyle(fontSize: 8),
                                ),
                                Text(
                                  _getNextGameDate(),
                                  style: TextStyle(fontSize: 8),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getBeginToEndDate() =>
      "${DateFormat.MMMd().format(league.beginEvent)} - "
      "${DateFormat.MMMd().format(league.endEvent)}, "
      "${DateFormat.y().format(league.beginEvent)}";

  String _getNextGameDate() =>
      DateFormat("EEEE, dd.MM.y").format(DateTime(2020, 8, 21));
}
