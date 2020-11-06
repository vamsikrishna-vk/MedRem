import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class Schedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScheduleState();
  }
}

class _ScheduleState extends State<Schedule> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  TimeOfDay time = TimeOfDay.now();
  _pickTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }

  int l, c;
  String _value, _value1;
  var docname, availablereports, availablereports1;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  List<DropdownMenuItem<String>> menuItems = List();
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
                  availablereports = new List(k + 1);
                  availablereports1 = new Map();
                  docname = new Map();

                  for (int i = 1; i <= k; i++) {
                    docname[i.toString()] =
                        snapshot.data["medications"][i.toString()]["doc name"];
                    availablereports[i] = snapshot.data["medications"]
                        [i.toString()]["reports"]["1"]["name"];
                    availablereports1[availablereports[i]] =
                        snapshot.data["medications"][i.toString()]["reports"]
                            ["1"]["report"];
                  }

                  print(docname);
                  print(availablereports);

                  return Container(
                      padding: EdgeInsets.all(20.0),
                      //color: Colors.white,
                      height: 400,
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
                            "Schedule Appointment",
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
                                    width: 260,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _value1,
                                      hint: Center(
                                        child: Text(
                                          "Select a Doctor",
                                        ),
                                      ),
                                      items: <String>[
                                        docname['1'],
                                        docname['2'],
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
                                Icon(Icons.calendar_today),
                                SizedBox(
                                  width: 90,
                                ),
                                Center(
                                    child: Text("${selectedDate.toLocal()}"
                                        .split(' ')[0])),
                                SizedBox(
                                  width: 63,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () => _selectDate(context),
                                  //child: Center(child: Text('Select date')),
                                ),
                              ],
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
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today),
                                SizedBox(
                                  width: 90,
                                ),
                                Center(
                                    child: Text(
                                        "Time: ${time.hour}:${time.minute}")),
                                SizedBox(
                                  width: 60,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () => _pickTime(context),
                                  //child: Center(child: Text('Select date')),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 22.0),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xFF6200EE),
                            onPressed: () {
                              firestoreInstance
                                  .collection("users")
                                  .doc(firebaseUser.uid)
                                  .update({
                                "scheduled appointmnets": {
                                  "doc name": _value1.toString(),
                                  "date": selectedDate.toString(),
                                  "time": time.toString(),
                                }
                              });
                            },
                            child: Text('Schedule'),
                          ),
                          SizedBox(height: 22.0),
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
