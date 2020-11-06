import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'medication.dart';

class ongoing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ONGOING();
  }
}

class _ONGOING extends State<ongoing> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  int k;
  var a;
  @override
  Widget build(BuildContext context2) {
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
                        case ConnectionState.waiting:
                          return CircularProgressIndicator();
                        default:
                          k = snapshot.data["medications"]["0"];
                          a = new List(k + 1);
                          for (int i = 1; i <= k; i++) {
                            a[i] = snapshot.data["medications"][i.toString()]
                                ["name"];
                          }
                          print(a);
                          return Container(
                              alignment: AlignmentDirectional(0.0, -0.8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/b2.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //child: SingleChildScrollView(
                              child: Container(
                                  alignment: AlignmentDirectional(0.0, -0.9),
                                  child: Column(children: <Widget>[
                                    SizedBox(height: 45.0),
                                    Text(
                                      "ON GOING MEDICATIONS",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    SizedBox(height: 25.0),
                                    Container(
                                      child: buildListview(context2),
                                    )
                                  ])));
                      }
                    }))));
  }

  ListView buildListview(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.transparent,
        height: 17.0,
      ),
      itemCount: k,
      shrinkWrap: true,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (_, index) {
        return InkWell(
            onTap: () => {
                  //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => med(index)),
                  //)
                },
            child: Container(
                child: Text(
                  a[index + 1].toString().toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                    color: Colors.white,
                    letterSpacing: 5.0,
                  ),
                ),
                height: 100.0,
                width: 250.0,
                alignment: AlignmentDirectional(0.0, 0.0),
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // 10% of the width, so there are ten blinds.
                    colors: [const Color(0xFF6200EE), const Color(0xaF6200EE)],

                    // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),

                      blurRadius: 10,
                      offset: Offset(0, 6), // changes position of shadow
                    ),
                  ],
                )));
      },
    );
  }
}
