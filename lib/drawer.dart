import 'package:flutter/material.dart';
import 'package:simple_app/pages/activity.dart';
import 'package:simple_app/pages/homepage.dart';
import 'package:simple_app/pages/login.dart';
import 'package:simple_app/pages/profile.dart';
import 'package:simple_app/pages/expenses/profile2.dart';
import 'package:simple_app/pages/booking.dart';


class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      
      child: ListView(

        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/c3/9e/d2/c39ed2eb3c6bbe734cc3542f2fb3d772.jpg'),
              backgroundColor: Colors.deepPurpleAccent,
              
              child: Text(
                '',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            accountName: Text(''),
            accountEmail: Text('elfana@utm.my'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('This is home'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              goToPage(context, HomePage());
            },
          ),
                ListTile(
            leading: Icon(Icons.live_help),
            title: Text('See Activity'),
            subtitle: Text('Sport Events here! '),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              goToPage(context, CarouselDemo());
            },
            ),
           ListTile(
            leading: Icon(Icons.nature_people),
            title: Text('My Profile'),
            subtitle: Text('View profile'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              goToPage(context, MyPage());
            },
           ),
                ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            subtitle: Text('You will log out'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              goToPage(context, LoginPage());
            },
          ),
        ],
     ),
      );
  }
  void goToPage(BuildContext context, dynamic page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}