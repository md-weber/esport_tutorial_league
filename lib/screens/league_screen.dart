import 'package:esport_tutorial_league/controller/league_controller.dart';
import 'package:esport_tutorial_league/models/league.dart';
import 'package:esport_tutorial_league/screens/league_screen/league_list_page.dart';
import 'package:flutter/material.dart';

import 'league_screen/navigation_bar.dart';

class LeagueScreen extends StatefulWidget {
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  PageController _pageController = PageController();
  Future<List<League>> pastLeagues = LeagueController().pastLeagues;
  Future<List<League>> currentLeagues = LeagueController().currentLeagues;
  Future<List<League>> upcomingLeagues = LeagueController().upcomingLeagues;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Leagues"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          NavigationBar(
            currentPage: currentPage,
            navigateToPage: (int index) => _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (int index) {
                currentPage = index;
                setState(() {});
              },
              controller: _pageController,
              children: [
                LeagueListPage(leagues: pastLeagues),
                LeagueListPage(leagues: currentLeagues),
                LeagueListPage(leagues: upcomingLeagues)
              ],
            ),
          )
        ],
      ),
    );
  }

  void changeToPageNo(int pageNumber) {
    _pageController.animateToPage(
      pageNumber,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
