import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class med extends StatefulWidget {
  final int index;
  med(this.index);

  @override
  State<StatefulWidget> createState() {
    a = index;
    return Medication();
  }
}

int a;
bool isSwitched = false;

class Medication extends State<med> {
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload,
      );
    }));
  }

  int hr, m;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
                              return CircularProgressIndicator();
                            default:
                              hr = snapshot.data["medications"]
                                  [(a + 1).toString()]["tab"]["3"][0];
                              m = snapshot.data["medications"]
                                  [(a + 1).toString()]["tab"]["3"][1];

                              return Container(
                                  child: Column(children: <Widget>[
                                SizedBox(height: 30),
                                Text(
                                  snapshot.data["medications"]
                                      [(a + 1).toString()]["name"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    height: 137,
                                    width: 356,
                                    decoration: new BoxDecoration(
                                      // Colors.white,
                                      color: new Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                            child: Container(
                                                width: 300,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 30),
                                                          SizedBox(
                                                              height: 30,
                                                              width: 140,
                                                              child: Text(
                                                                "Doctor Name",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      19.0,
                                                                ),
                                                              )),
                                                          SizedBox(
                                                              height: 30,
                                                              width: 130,
                                                              child: Text(
                                                                snapshot.data[
                                                                        "medications"][(a +
                                                                            1)
                                                                        .toString()]
                                                                    [
                                                                    "doc name"],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      19.0,
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 30),
                                                          SizedBox(
                                                              height: 30,
                                                              width: 140,
                                                              child: Text(
                                                                "Specialization",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      19.0,
                                                                ),
                                                              )),
                                                          SizedBox(
                                                              height: 30,
                                                              width: 130,
                                                              child: Text(
                                                                snapshot.data[
                                                                        "medications"][(a +
                                                                            1)
                                                                        .toString()]
                                                                    [
                                                                    "Specialization"],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      19.0,
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 30),
                                                          SizedBox(
                                                              height: 30,
                                                              width: 140,
                                                              child: Text(
                                                                "Last Visit",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      19.0,
                                                                ),
                                                              )),
                                                          SizedBox(
                                                              height: 30,
                                                              width: 130,
                                                              child: Text(
                                                                snapshot.data[
                                                                        "medications"]
                                                                        [(a + 1)
                                                                            .toString()]
                                                                        ["last"]
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      19.0,
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))))),
                                SizedBox(height: 30),
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    height: 100,
                                    width: 356,
                                    decoration: new BoxDecoration(
                                      // Colors.white,
                                      color: new Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                    ),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          padding: EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data["medications"]
                                                        [(a + 1).toString()]
                                                        ["tab"]["1"]
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                snapshot.data["medications"]
                                                        [(a + 1).toString()]
                                                    ["tab"]["2"],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        SizedBox(
                                          height: 100,
                                          child: Center(
                                            child: Text(
                                              snapshot.data["medications"]
                                                          [(a + 1).toString()]
                                                          ["tab"]["3"][0]
                                                      .toString() +
                                                  " : " +
                                                  snapshot.data["medications"]
                                                          [(a + 1).toString()]
                                                          ["tab"]["3"][1]
                                                      .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Switch(
                                          value: isSwitched,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = value;
                                              if (isSwitched == true) {
                                                scheduleNotification(hr, m);
                                              } else {
                                                cancelNotification();
                                              }
                                            });
                                          },
                                          activeTrackColor:
                                              Colors.lightGreenAccent,
                                          activeColor: Colors.green,
                                        ),
                                      ],
                                    )))
                              ]));
                          }
                        })))));
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Flutter devs', 'Flutter Local Notification Demo', platform,
        payload: 'Welcome to the Local Notification demo ');
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  Future<void> scheduleNotification(int hr, int m) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 3));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      priority: Priority.High,
      importance: Importance.Max,
      icon: 'mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Time for Corona Medication',
        'paracetemol 500mg',
        //scheduledNotificationDateTime as Time,
        Time(hr, m, 00),
        platformChannelSpecifics);
  }
}

class NewScreen extends StatelessWidget {
  String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
    );
  }
}
