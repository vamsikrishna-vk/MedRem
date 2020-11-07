import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      child: Container(
          child: StreamBuilder(
              stream: firestoreInstance
                  .collection("users")
                  .doc(firebaseUser.uid)
                  .snapshots(),
              builder: (context1, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "PROFILE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          radius: 85,
                          backgroundImage:
                              NetworkImage(snapshot.data["photo"].toString()),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Name : \t" +
                              snapshot.data["name"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Phone : \t " +
                              snapshot.data["phone"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "DOB : \t" +
                              snapshot.data["DOB"].toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Medications : \t" +
                              snapshot.data["medications"]["0"]
                                  .toString()
                                  .toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ButtonTheme(
                          minWidth: 150.0,
                          height: 40.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          child: RaisedButton(
                            onPressed: () => {
                              context.read<AuthenticationService>().signOut(),
                            },
                            color: Colors.redAccent,
                            elevation: 4.0,
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                }
              })),
    )));
  }
}
