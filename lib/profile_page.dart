

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            CircleAvatar(
              child: Icon(Icons.person),
            ),

            Text("Name"),
            Text("Account")

          ],
        ),
      ),
    );
  }

}