import 'package:flutter/material.dart';
import 'package:simple_app/pages/booking2.dart';
import 'package:simple_app/pages/expenses/main.dart';
import 'package:simple_app/pages/expenses/create.dart';
import 'package:simple_app/pages/expense.dart';
import 'package:simple_app/pages/homepage.dart';
import 'package:simple_app/pages/register.dart';
//import 'package:simple_app/pages/activity.dart';

class LoginPage extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          backgroundLayer(),
          mainLayer(context),
     //     inputUserName(),
     //     inputPassword(),
    //      submitbutton(context),
        ],
      ),
    );
  }

  Widget backgroundLayer() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          colors: [
            Colors.blueAccent[200],
            Colors.blueGrey[300],
           // Colors.green,
          ],
        ),
      ),
    );
  }

  Widget mainLayer(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Image.asset(
            'assets/icons/sportcolor.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            ' Welcome To ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'UTM GO-SUKAN',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans',
             fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20),
          inputUserName(),
          SizedBox(height: 20),
          inputPassword(),
          SizedBox(height: 20),
         submitbutton(context),
          SizedBox(height: 15,),
          registerbutton(context),
        ])))
        // child: Text('Login Page'),
        );
  }

  Widget inputUserName() {
    return TextFormField(
      controller: userName,
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.account_circle),
      ),
    );
  }

 Widget inputPassword() {
    return TextFormField(
      controller: passWord,
      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.vpn_key),
      ),
    );
  }
  
  Widget submitbutton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          'Continue'.toUpperCase(),
          style: TextStyle( 
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage (
              //Homepage
              //  userName: userName.text,
              ),
            ),
          );
        },
      ),
    );
  }
    Widget registerbutton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: Colors.deepPurple,
        child: Text(
          'Register'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>   RegistrationScreen (
              //Homepage
              //  userName: userName.text,
              ),
              
            ),

          );
        },
      ),
    );
    
  }
  
}

