import 'package:flutter/material.dart';
import 'package:simple_app/pages/booking2.dart';
import 'package:simple_app/pages/booking3.dart';
import 'package:simple_app/pages/booking4.dart';
import 'package:simple_app/pages/expenses/create.dart';
import 'package:simple_app/pages/expenses/main.dart';
import 'package:simple_app/pages/login.dart';
import 'package:simple_app/drawer.dart';
import 'package:simple_app/pages/booking.dart';
import 'package:simple_app/services/helper-service.dart';
import 'package:simple_app/services/storage-service.dart';

class HomePage extends StatelessWidget {
    final String userName;

    HomePage({this.userName});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('GO-SUKAN'),
         backgroundColor: Colors.blue,
      ),
          drawer: NavigationDrawer(),
           //drawer
      

      body: new Container(
        
        child: ListView(
       
     
          children: <Widget>[
          
              Container(
                decoration: new BoxDecoration(color: Colors.blueGrey[50]),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                     Container(
                       width: 100.0,
                       height: 100.0,
                       color: Colors.deepPurpleAccent,
                       child: new Icon(Icons.home, color: Colors.white, size: 50.0,),
                        
                     ),
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.all(15.0),
                         height: 100.0,
                         color: Colors.grey[400],
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                         //  children: <Widget>[
                        //     Text("Sport Hall 2 - UTM", style: TextStyle(color: Colors.black, fontSize: 15.0)),
                         //    Text("Kolej Tun Fatimah", style: TextStyle(color: Colors.black),),
                          children: <Widget>[
                            Text("Sport Hall 2 - UTM | KTF", style: TextStyle(color: Colors.black, fontSize: 15.0)),
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Book Now!"),
                                onPressed: () {
                                            Navigator.push(
                                                 context,
                              MaterialPageRoute(builder: (context) => BookingPage()),
                                );
                                }
                              ),
                           ],
                         ),          
                       ),
                     )
                  ],
                ),
                
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    
                     Container(
                       width: 100.0,
                       height: 100.0,
                       color: Colors.deepPurpleAccent,
                       child: new Icon(Icons.home, color: Colors.white, size: 50.0,),
                     ),
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.all(15.0),
                         height: 100.0,
                         color: Colors.grey[400],
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                        Text("Sport Hall 1 - UTM | KP", style: TextStyle(color: Colors.black, fontSize: 15.0)),
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Book Now!"),
                                onPressed: () {
                                            Navigator.push(
                                                 context,
                              MaterialPageRoute(builder: (context) => BookingPage2()),
                                );
                                }
                              ),
                           ],
                         ),
                       ),
                     )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                     Container(
                       width: 100.0,
                       height: 100.0,
                       color: Colors.deepPurpleAccent,
                       child: new Icon(Icons.home, color: Colors.white, size: 50.0,),
                     ),
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.all(15.0),
                         height: 100.0,
                         color: Colors.grey[400],
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                            Text("NETBALL COURT - UTM | KTF", style: TextStyle(color: Colors.black, fontSize: 15.0)),
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Book Now!"),
                                onPressed: () {
                                            Navigator.push(
                                                 context,
                              MaterialPageRoute(builder: (context) => BookingPage3()),
                                );
                                }
                              ),
                           ],
                         ),
                       ),
                     )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                     Container(
                       width: 100.0,
                       height: 100.0,
                       color: Colors.deepPurpleAccent,
                       child: new Icon(Icons.home, color: Colors.white, size: 50.0,),
                     ),
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.all(15.0),
                         height: 100.0,
                         color: Colors.grey[400],
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                        //     Text("UTM SWIMMING POOL", style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        //     Text("AZMAN HASHIM", style: TextStyle(color: Colors.black),)
                        children: <Widget>[
                            Text("STADIUM AZMAN HASHIM", style: TextStyle(color: Colors.black, fontSize: 15.0)),
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Book Now!"),
                                onPressed: () {
                                            Navigator.push(
                                                 context,
                              MaterialPageRoute(builder: (context) => BookingPage4()),
                                );
                                }
                              ),
                           ],
                         ),
                       ),
                     )
                  ],
                ),
              ),
          ],
        ),
      ),

    );
    } 
    
}
