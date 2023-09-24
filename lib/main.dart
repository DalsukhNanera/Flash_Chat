import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyDQxtBFEOctqnsQ48XZC8mkmigtxJqCtaU",
      appId: "1:274111017665:android:7bf76df9b5957b20ee9a40",
      messagingSenderId: "274111017665",
      projectId: "flash-chat-d311e",
      storageBucket: null,
      databaseURL: null,
    ),);

    
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routename:(context) => WelcomeScreen(),
        LoginScreen.routename:(context) => LoginScreen(),
        RegistrationScreen.routename:(context) => RegistrationScreen(),
        ChatScreen.routename:(context) => ChatScreen(),
        
      },
    );
  }
}
