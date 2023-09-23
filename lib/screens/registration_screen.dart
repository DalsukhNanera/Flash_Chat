
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../componenets/roundbutton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'../screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const routename = '/registretion_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showspinning = false ;
  @override
  void initState() {
    
    super.initState();
  }

  void ok() async {
try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
   
  }
  final _auth = FirebaseAuth.instance;
  String email ;
  String password ;
  @override
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
              Hero(
                tag: 'hero',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value ;
                },
                decoration: ktextfielddecoration.copyWith(hintText: 'Enter your email' ,prefixIcon: Icon(Icons.alternate_email) ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                 password = value ;
                },
                decoration: ktextfielddecoration.copyWith(hintText: 'Enter Your Password' , prefixIcon: Icon(Icons.lock_open)),
              ),
              SizedBox(
                height: 24.0,
              ),
             roundbutton(title: 'Register',color: Colors.blueAccent,controller: () async{

              setState(() {
                showspinning = true ;
              });
              try{
             final newuser = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
             if(newuser != null)
             {
              Navigator.of(context).pushNamed(ChatScreen.routename);
             }

             setState(() {
               showspinning = false ;
             });
              }
              catch(e){
                Navigator.of(context).pushNamed(WelcomeScreen.routename);
              }
      
             },)
            ],
          ),
        ),
      ),
    );
  }
}
