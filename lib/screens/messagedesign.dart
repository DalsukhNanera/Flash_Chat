
import 'package:flutter/material.dart';




class messagedesign extends StatelessWidget {
  final String sender;
  final String message;
  bool isme;

  messagedesign(
      {@required this.sender, @required this.message, @required this.isme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: isme ? CrossAxisAlignment.end: CrossAxisAlignment.start ,
       children: [
        Text(
          sender,
          style: TextStyle(fontSize: 12.0, color: Colors.black54),
        ),
        Material(
          borderRadius: isme ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)): BorderRadius.only(bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30)),
          elevation: 5,
          color: isme ? Colors.lightBlueAccent : Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              '$message',
              style: TextStyle(
                fontSize: 15,
                color: isme ?Colors.white : Colors.black54,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
