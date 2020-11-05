import 'package:life_care_hospitals/emergency.dart';
import 'package:life_care_hospitals/home1.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:life_care_hospitals/signup.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _status = 'no-action';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF6200EE),
            title: Text("LIFE CARE HOSPITALS"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Text("DOWNLOAD REPORTS"),
              Container(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    //color: Colors.white,
                    height: 367,
                    width: 356,
                    decoration: new BoxDecoration(
                      // Colors.white,
                      color: new Color.fromRGBO(255, 255, 255, 0.7),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(

                            height: 22.0,
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                DropdownButton<String>(
                                  items: <String>['masi', 'vamshi', 'serji', 'jayanth'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ],
                            )
//                            TextFormField(
//                                controller: emailController,
//                                decoration: InputDecoration(
//                                  border: const OutlineInputBorder(
//                                    borderSide: BorderSide.none,
//                                  ),
//                                  hintText: 'DOCTOR NAME',
//                                  filled: true,
//                                  fillColor: new Color.fromRGBO(0, 0, 0, 240.0),
//                                  contentPadding: const EdgeInsets.only(
//                                      left: 14.0, bottom: 8.0, top: 8.0),
//                                ))
                        ),

                        SizedBox(height: 22.0),
                        SizedBox(
                            height: 50.0,
                            child: Row(
                              children: [
                                Icon(Icons.date_range),
                                TextFormField(
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'DATE\ndd-mm-yy',
                                      filled: true,
                                      fillColor: new Color.fromRGBO(0, 0, 0, 240.0),
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                    )),
                              ],
                            )),
                        SizedBox(height: 22.0),
                        SizedBox(
                          height: 50.0,
                          child: Row(
                            children: [
                              Icon(Icons.timer),
                              TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'TIME',
                                    filled: true,
                                    fillColor: new Color.fromRGBO(0, 0, 0, 240.0),
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                  )),
                            ],
                          ),
                        ),

                        SizedBox(height: 22.0),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Color(0xFF6200EE),
                          onPressed: () {
                            context.read<AuthenticationService>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          },
                          child: Text('SCHEDULE'),
                        ),
                        SizedBox(height: 22.0),
                        Text('see scheduled appointments'),
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signup()),
                            );
                          },
                          child: new Text(
                            "New User? Signup",
                            style: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                          ),
                        )
                      ],
                    )),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/b2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
