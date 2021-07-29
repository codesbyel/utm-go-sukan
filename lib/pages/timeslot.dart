import 'package:flutter/material.dart';
import 'package:native_color/native_color.dart';

class TimeSlotPage extends StatelessWidget {


//to make listing

  List slot= [
    {
      'time' : '9am - 10am',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '10am - 11am',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '11am - 12pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '12pm - 1pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '2pm - 3pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '4pm - 5pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '5pm - 6pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '6pm - 7pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '8pm - 9pm',
      'hex_color': 'EB5E55',
    },
    {
      'time' : '9pm - 10pm',
      'hex_color': 'EB5E55',
    },    
        
  ];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text ('Select Time Slot'),
      ),

      //to show the listings
      body: ListView.builder(
        itemCount :slot.length,
        itemBuilder:(BuildContext context, int index) {
          return ListTile (
            leading: CircleAvatar(
                backgroundColor: HexColor(slot[index] ['hex_color']),
            ),
              title: Text(slot[index] ['time']),

            //route to page => 
              onTap: () {
                Navigator.pop(context, slot[index]);
              },
          ); 
        }
      )
    );
  }
}