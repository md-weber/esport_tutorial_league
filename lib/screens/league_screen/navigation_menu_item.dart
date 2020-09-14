import 'package:flutter/material.dart';

class NavigationMenuItem extends StatelessWidget {
  final Animation<Color> textAnimation;
  final AnimationController animationController;
  final String menuItemLabel;
  final CrossAxisAlignment crossAxisAlignment;

  const NavigationMenuItem(
      {Key key,
      this.textAnimation,
      this.animationController,
      this.menuItemLabel,
      this.crossAxisAlignment = CrossAxisAlignment.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Expanded(
          child: Center(
            child: Text(
              menuItemLabel,
              style: TextStyle(color: textAnimation.value),
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: animationController.value * constraints.maxWidth,
            height: 2,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color(0xFF00C1C0),
              width: 2,
            ))),
          ),
        )
      ],
    );
  }
}
