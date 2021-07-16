import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {

  final Positioned catImage;
  final Align label;
  final Function onTap;

  ReusableCard({@required this.catImage, @required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(14.0, 20.0, 14.0, 20.0),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          catImage,
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: label,
          ),
        ],
      ),
    );
  }
}