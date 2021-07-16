import 'package:catnap/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class GoodnightPage extends StatelessWidget{

  GoodnightPage({@required this.time});

  final String time;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/bgimage.png'),
        fit: BoxFit.cover,
      )),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              new IconButton(
                icon: new Image.asset('images/logo.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Container(
            decoration: kStarsBG, //linagay ko sa contants yung stars image
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Goodnight.",
                      style: TextStyle(
                        fontFamily: 'MadelynFill',
                        fontSize: 75,
                        //height: 2,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'images/cat4.png',
                    ),
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        'We will wake you up tomorrow at',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    //Kunin time nung alarm
                    child: Text(
                        time,
                        style: TextStyle(
                        // fontFamily: 'RobotoMono-Regular',
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, right: 60),
                      child: CalculateAgainCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        label: Align(
                          alignment: Alignment.center,
                          child: Text('Calculate Again'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CalculateAgainCard extends StatelessWidget {
  final Align label;
  final Function onTap;

  CalculateAgainCard({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: label,
        // margin: EdgeInsets.fromLTRB(14.0, 20.0, 14.0, 20.0),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
