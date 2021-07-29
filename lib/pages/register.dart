import 'package:flutter/material.dart';
import 'package:simple_app/pages/homepage.dart';
import 'package:simple_app/services/navigation_router.dart';
import 'package:simple_app/pages/login.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text('Registration Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          )
        ],
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),

          child: new Form(

            child: new ListView(
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(20.0),
                    child:new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlutterLogo(
                          size: 100.0,
                        ),
                      ],
                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'User Name',
                          labelText: 'Enter your user name',
                          icon: new Icon(Icons.person),
                        )

                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'E-mail Address',
                            icon: new Icon(Icons.email))

                    )
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter your password',
                          icon: new Icon(Icons.lock)

                      )
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child:  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Enter your confirm password',
                          icon: new Icon(Icons.lock
                          )

                      )
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height:50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                      child: new RaisedButton(
                       color: Colors.deepPurple,
                        child: new Text(
                          'Register',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                        context,
                             MaterialPageRoute(
                             builder: (context) =>   HomePage (
                          ),
                    ),
                      );
                        }
                    ),
                    ),
                    ],
                ),

              ],
            ),
          )
      ),
    );
  }

  _performLogin() {

  }

  _navigateRegistration() {
    NavigationRouter.switchToRegistration(context);
  }
}