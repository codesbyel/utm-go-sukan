import 'package:flutter/material.dart';
import 'package:simple_app/drawer.dart';
import 'package:simple_app/pages/expenses/profile2.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blue,

      ),
      drawer: NavigationDrawer(), //drawer

      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPage()));
            },
        ),
      ),
    );
  }
}
