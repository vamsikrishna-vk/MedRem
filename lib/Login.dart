import 'package:flutter/material.dart';


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
      body: Container(
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
                SizedBox(height: 22.0),
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),
                ),
                SizedBox(height: 22.0),
                SizedBox(
                    height: 50.0,
                    child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'UserID',
                          filled: true,
                          fillColor: new Color.fromRGBO(0, 0, 0, 240.0),
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                        ))),
                SizedBox(height: 22.0),
                SizedBox(
                  height: 50.0,
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Password',
                        filled: true,
                        fillColor: new Color.fromRGBO(0, 0, 0, 240.0),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                      )),
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
                  child: Text('Login'),
                ),
                SizedBox(height: 22.0),
                //Text('New User? Signup'),
                new GestureDetector(
                  onTap: () {


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
    ));
  }
}
