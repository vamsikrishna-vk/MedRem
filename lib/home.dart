import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

var currDt = DateTime.now();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home2(),
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState1();
  }
}

var firebaseUser = FirebaseAuth.instance.currentUser;
final firestoreInstance = FirebaseFirestore.instance;
String X = " ";

class _HomeState1 extends State<Home2> {
  String Y = "User";

  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context1) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              child: StreamBuilder(
        stream: firestoreInstance
            .collection("users")
            .doc(firebaseUser.uid)
            .snapshots(),
        builder: (context1, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              return Container(
                alignment: AlignmentDirectional(0.0, -0.8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/b2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Container(
                      alignment: AlignmentDirectional(0.0, -0.8),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text(
                            "HI " +
                                snapshot.data["name1"]
                                    .toString()
                                    .toUpperCase() +
                                "!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          if (currDt.hour >= 0 && currDt.hour < 12)
                            (Text(
                              "Good Morning.....",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ))
                          else if (currDt.hour >= 12 && currDt.hour < 16)
                            (Text(
                              "Good Afternoon.....",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ))
                          else
                            (Text(
                              "Good Evening.....",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            )),
                          SizedBox(height: 30.0),
                          Container(
                            child: Column(children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () => {},
                                        child: Container(
                                          child: Column(children: <Widget>[
                                            Image.asset(
                                              "images/capsules.png",
                                              height: 80.0,
                                              width: 80.0,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                                'On Going medications'
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ))
                                          ]),

                                          padding: EdgeInsets.all(10.0),
                                          //color: Colors.white,
                                          height: 150.0,
                                          width: 150.0,
                                          decoration: new BoxDecoration(
                                            //color: Colors.lightBlue,
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              // 10% of the width, so there are ten blinds.
                                              colors: [
                                                const Color(0xff0082FF),
                                                const Color(0xff76BCFF)
                                              ],
                                              // red to yellow
                                              tileMode: TileMode
                                                  .repeated, // repeats the gradient over the canvas
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),

                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    6), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(width: 30.0),
                                    Container(
                                      child: Column(children: <Widget>[
                                        Image.asset(
                                          "images/appointment.png",
                                          height: 80.0,
                                          width: 80.0,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                            'Schedule Appointment'
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ))
                                      ]),
                                      padding: EdgeInsets.all(10.0),
                                      //color: Colors.white,
                                      height: 150.0,
                                      width: 150.0,
                                      decoration: new BoxDecoration(
                                        //color: Colors.blueGrey,
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          // 10% of the width, so there are ten blinds.
                                          colors: [
                                            const Color(0xffFF812D),
                                            const Color(0xffFFC44E)
                                          ],
                                          // red to yellow
                                          tileMode: TileMode
                                              .repeated, // repeats the gradient over the canvas
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),

                                            blurRadius: 7,
                                            offset: Offset(0,
                                                6), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 30.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Column(children: <Widget>[
                                        Image.asset(
                                          "images/report.png",
                                          height: 80.0,
                                          width: 80.0,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text('Download Reports'.toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ))
                                      ]),
                                      padding: EdgeInsets.all(9.0),
                                      //color: Colors.white,
                                      height: 150.0,
                                      width: 150.0,
                                      decoration: new BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          // 10% of the width, so there are ten blinds.
                                          colors: [
                                            const Color(0xffCE65FC),
                                            const Color(0xffFF6767)
                                          ],
                                          // red to yellow
                                          tileMode: TileMode
                                              .repeated, // repeats the gradient over the canvas
                                        ),
                                        //color: Colors.lightBlue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),

                                            blurRadius: 7,
                                            offset: Offset(0,
                                                6), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 30.0),
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      //color: Colors.white,
                                      height: 150.0,
                                      width: 150.0,
                                    ),
                                  ]),
                              SizedBox(height: 100.0),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
          }
        },
      ))),
    );
  }
}
