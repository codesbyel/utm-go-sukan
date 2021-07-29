import 'package:flutter/material.dart';
import 'package:native_color/native_color.dart';

class CategoryPage extends StatelessWidget {


//to make listing

  List categories  = [
    {
      'name' : 'UTM STUDENT',
      'hex_color': 'FFDB8E',
    },
    {
      'name' : 'UTM STAFF',
      'hex_color': 'EB5E55',
    },
  ];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.blue,
        title: Text ('Select Category'),
      ),

      //to show the listings
      body: ListView.builder(
        itemCount : categories.length,
        itemBuilder:(BuildContext context, int index) {
          return ListTile (
            leading: CircleAvatar(
                backgroundColor: HexColor(categories[index] ['hex_color']),
            ),
              title: Text(categories[index] ['name']),

            //route to page => 
              onTap: () {
                Navigator.pop(context, categories[index]);
              },
          ); 
        }
      )
    );
  }
}