import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

var currDt = DateTime.now();
int x = 0;

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      alignment: AlignmentDirectional(0.0, 0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/b2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/emer.png',
            height: 300.0,
            width: 300.0,
          ),
          SizedBox(
            height: 25,
          ),
          ButtonTheme(
            minWidth: 250.0,
            height: 60.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
            child: RaisedButton(
              onPressed: () {
                _showDialog(context);
              },
              color: Color(0xffFF3C3C),
              elevation: 4.0,
              child: Text(
                "Notify Hospital".toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Do you want to notify hospital"),
          content: new Text(
              "clicking YES notifies hospital that you are in an emergency"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();

                firestoreInstance
                    .collection("users")
                    .doc(firebaseUser.uid)
                    .update({"Emergency": "True"});
                Fluttertoast.showToast(
                  msg: "Notified to Hospital!",
                );
              },
            ),
          ],
        );
      },
    );
  }
}
