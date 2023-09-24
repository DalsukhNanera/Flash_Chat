import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/toastmessage.dart';
import 'package:flutter/material.dart';
import '../componenets/roundbutton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const routename = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showspinning = false;

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinning,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: ktextfielddecoration.copyWith(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.alternate_email)),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: ktextfielddecoration.copyWith(
                    hintText: 'Enter your PassWord',
                    prefixIcon: Icon(Icons.lock_open)),
              ),
              SizedBox(
                height: 24.0,
              ),
              roundbutton(
                title: 'Log In',
                color: Colors.blueAccent,
                controller: () async {
                  setState(() {
                    showspinning = true;
                  });
                  try {
                    final user = await _auth
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    if (user != null) {
                      Navigator.of(context).pushNamed(ChatScreen.routename);
                    }
                    setState(() {
                      showspinning = false;
                    });

                    if(user == null)
                    {
                      toastmessage.errormessage('invalid credetails');
                      print("i am here");
                    }
                  }
                   catch (e) {
                    setState(() {
                      showspinning = false;
                    });
                    toastmessage.errormessage(e.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
