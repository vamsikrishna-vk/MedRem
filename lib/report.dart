import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'authentication_service.dart';

class Reports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReportState();
  }
}

class _ReportState extends State<Reports> {
  String _value, _value1;
  var docname, docname1;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        alignment: AlignmentDirectional(0.0, 0.0),
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
                  int k = snapshot.data["medications"]["0"];
                  print(k);
                  docname = new Map();
                  for (int i = 1; i <= k; i++) {
                    docname[i.toString()] =
                        snapshot.data["medications"][i.toString()]["doc name"];
                  }
                  docname1 = ["happy", "birthday", "to", "you"];
                  print(docname);
                  return Container(
                      padding: EdgeInsets.all(20.0),
                      //color: Colors.white,
                      height: 327,
                      width: 356,
                      decoration: new BoxDecoration(
                        // Colors.white,
                        color: new Color.fromRGBO(255, 255, 255, 0.7),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 22.0),
                          Text(
                            "Dowonload Reports",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                            ),
                          ),
                          SizedBox(height: 22.0),

                          Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: new Color.fromRGBO(0, 0, 0, 240.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: SizedBox(
                                  child: Row(
                                children: [
                                  Icon(Icons.person),
                                  Container(
                                    height: 50.0,
                                    width: 270,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _value1,
                                      hint: Center(
                                        child: Text(
                                          "From Doctor",
                                        ),
                                      ),
                                      items: <String>[
                                        docname['1'],
                                      ].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Center(child: Text(value)),
                                        );
                                      }).toList(),
                                      onChanged: (newValue1) {
                                        setState(() {
                                          _value1 = newValue1;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ))),
                          SizedBox(height: 22.0),
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: new Color.fromRGBO(0, 0, 0, 240.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              children: [
                                Icon(Icons.library_books),
                                SizedBox(
                                    height: 50.0,
                                    width: 270,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _value,
                                      hint: Center(
                                          child: Text("select a report")),
                                      items: <String>[
                                        'report 1',
                                        'report 2',
                                        'report 3',
                                        'report4'
                                      ].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Center(child: Text(value)),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _value = newValue;
                                        });
                                      },
                                    )),
                              ],
                            ),
                          ),

                          SizedBox(height: 22.0),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xFF6200EE),
                            onPressed: () {},
                            child: Text('Download'),
                          ),
                          SizedBox(height: 22.0),
                          //Text('New User? Signup'),
                        ],
                      ));
              }
            }),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/b2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
