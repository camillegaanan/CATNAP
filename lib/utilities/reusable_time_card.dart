import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:catnap/services/compute_sleeping_time.dart';

class ReusableTimeCard extends StatelessWidget {

  int count = 0;
  final Color colour;
  final ComputeSleepingTime computeSleepingTime;
  final EdgeInsetsGeometry edge;

  ReusableTimeCard({@required this.count, @required this.colour, @required this.computeSleepingTime, @required this.edge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edge,
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container (
          height: 180.0,
          width:70.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
            child: Center(
              child: Text(
                computeSleepingTime.getTime(count),
                textAlign: TextAlign.center,
                style: kTimeCardTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}