import 'package:catnap/utilities/constants.dart';
import 'package:catnap/screens/sleep_page.dart';
import 'package:catnap/screens/wake_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'relax_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kStarsBG, //linagay ko sa contants yung stars image
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0, top: 35.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset('images/logoNamed.png'),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SleepPage(),
                      ),
                    );
                  },
                  catImage: Positioned(
                    width: 150.0,
                    height: 150.0,
                    right: 10.0,
                    bottom: -10.0,
                    child: Image.asset('images/cat1.png'),
                  ),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('What time should \nI sleep?'),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WakePage(),
                      ),
                    );
                  },
                  catImage: Positioned(
                    width: 170.0,
                    height: 170.0,
                    left: 10.0,
                    bottom: -10.0,
                    child: Image.asset('images/cat2.png'),
                  ),
                  label: Align(
                    alignment: Alignment.centerRight,
                    child: Text('What time should \nI wake up?',
                        textAlign: TextAlign.right),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RelaxPage(),
                      ),
                    );
                  },
                  catImage: Positioned(
                    width: 170.0,
                    height: 170.0,
                    right: 20.0,
                    bottom: 0.0,
                    child: Image.asset('images/cat3.png'),
                  ),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Meditate \nand Relax'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Positioned catImage;
  final Align label;
  final Function onTap;

  ReusableCard(
      {@required this.catImage, @required this.label, @required this.onTap});

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
