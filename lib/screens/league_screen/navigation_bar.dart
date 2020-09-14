import 'package:esport_tutorial_league/screens/league_screen/navigation_menu_item.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  final Function(int) navigateToPage;
  final int currentPage;

  const NavigationBar({Key key, this.navigateToPage, this.currentPage})
      : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
    with TickerProviderStateMixin {
  AnimationController _pastAnimationController;
  AnimationController _currentAnimationController;
  AnimationController _upcomingAnimationController;

  Animation<Color> _pastTextAnimation;
  Animation<Color> _currentTextAnimation;
  Animation<Color> _upcomingTextAnimation;

  ColorTween _pastTween =
      ColorTween(begin: const Color(0xFF707070), end: const Color(0xFFFFFFFF));
  ColorTween _currentTween =
      ColorTween(begin: const Color(0xFF707070), end: const Color(0xFFFFFFFF));
  ColorTween _upcomingTween =
      ColorTween(begin: const Color(0xFF707070), end: const Color(0xFFFFFFFF));

  @override
  void initState() {
    super.initState();

    _pastAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          })
          ..forward();

    _currentAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });

    _upcomingAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });

    _pastTextAnimation = _pastTween.animate(_pastAnimationController);
    _currentTextAnimation = _currentTween.animate(_currentAnimationController);
    _upcomingTextAnimation =
        _upcomingTween.animate(_upcomingAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _upcomingAnimationController.dispose();
    _currentAnimationController.dispose();
    _pastAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animateToCorrespondingPage(widget.currentPage);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF303140),
          border: Border(
            bottom: BorderSide(color: Color(0xFF000000), width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  _pastAnimationController.forward();
                  _currentAnimationController.reverse();
                  _upcomingAnimationController.reverse();
                  widget.navigateToPage(0);
                },
                child: NavigationMenuItem(
                  menuItemLabel: "Past",
                  textAnimation: _pastTextAnimation,
                  animationController: _pastAnimationController,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _pastAnimationController.reverse();
                  _currentAnimationController.forward();
                  _upcomingAnimationController.reverse();
                  widget.navigateToPage(1);
                },
                child: NavigationMenuItem(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  menuItemLabel: "Current",
                  textAnimation: _currentTextAnimation,
                  animationController: _currentAnimationController,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _pastAnimationController.reverse();
                  _currentAnimationController.reverse();
                  _upcomingAnimationController.forward();
                  widget.navigateToPage(2);
                },
                child: NavigationMenuItem(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  menuItemLabel: "Upcoming",
                  textAnimation: _upcomingTextAnimation,
                  animationController: _upcomingAnimationController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void animateToCorrespondingPage(int currentPage) {
    _pastAnimationController.reverse();
    _currentAnimationController.reverse();
    _upcomingAnimationController.reverse();

    switch (currentPage) {
      case 0:
        _pastAnimationController.forward();
        break;
      case 1:
        _currentAnimationController.forward();
        break;
      case 2:
        _upcomingAnimationController.forward();
        break;
      default:
        _pastAnimationController.forward();
    }
  }
}
