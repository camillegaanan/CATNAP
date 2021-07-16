import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:catnap/services/compute_waking_time.dart';

class ReusableTimeButton extends StatelessWidget {

  final int count;
  final Color colour;
  final ComputeWakingTime computeWakingTime;
  final Function onTap;
  final EdgeInsetsGeometry edge;

  ReusableTimeButton({@required this.count, @required this.colour, @required this.computeWakingTime, @required this.onTap, @required this.edge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edge,
      child: Container(
        decoration: BoxDecoration(
          //color: kTimeCard1,
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container (
              height: 180.0,
              width:70.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
                child: Center(
                  child: Text(
                    //'10\n45\nPM',
                    computeWakingTime.getTime(count),
                    textAlign: TextAlign.center,
                    style: kTimeCardTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}