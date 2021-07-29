/* THIS BOOKING PAGE 3 IS FOR NETBALL COURT */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_app/services/helper-service.dart';
import 'package:simple_app/pages/category.dart';

import 'package:simple_app/pages/timeslot.dart';

class BookingPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Booking();
  }
}

class Booking extends State<BookingPage3> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  bool showLoading = false;

  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController timeslot = TextEditingController();
  TextEditingController date = TextEditingController(
    text: HelperService().defaultDate(
      DateTime.now(),
    ),
  );

  String photo = '';
  Map selectedCategory;

  @override
  void dispose() {
    amount.dispose();
    category.dispose();
    date.dispose();
    super.dispose();
    timeslot.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NETBALL COURT | Booking Confirmation'),
         backgroundColor: Colors.blue,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          autovalidate: autoValidate,
          child: Column(
            children: <Widget>[
  //            inputAmount(),
              SizedBox(height: 10.0),
              inputCategory(),
              SizedBox(height: 10.0),
              inputDate(),
              SizedBox(height: 10.0),
              inputTimeSlot(),
              SizedBox(height: 10.0),
   //           showLoading == false ? inputPhoto() : CircularProgressIndicator(),
              SizedBox(height: 20.0),
              saveButton(context),
            ],
          ),
        ),
      ),
    );
  }
/*
  Widget inputAmount() {
    return TextFormField(
      controller: amount,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.attach_money,
          size: 36.0,
        ),
        hintText: '0',
        hintStyle: TextStyle(fontSize: 36.0),
      ),
      style: TextStyle(
        fontSize: 36.0,
      ),
      keyboardType: TextInputType.number,
      autofocus: true,
      validator: (String value) {
        if (value == '0' || value.isEmpty) {
          return 'Amount transaction is required';
        }
        return null;
      },
    );
  }
*/

  Widget inputCategory() {
    return TextFormField(
      controller: category,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.star),
        hintText: 'Select Category',
      ),
      keyboardType: TextInputType.text,
      readOnly: true,
      onTap: () => goToCategoryPage(),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please select category';
        }
        return null;
      },
    );
  }

  goToCategoryPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(),
      ),
    );
    setState(() {
      selectedCategory = result;
      category.text = selectedCategory['name'];
    });
  }

  Widget inputDate() {
    return TextFormField(
      controller: date,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today),
        hintText: 'Select Date',
      ),
      keyboardType: TextInputType.text,
      readOnly: true,
      onTap: () {
        openDatePicker();
      },
    );
  }

  openDatePicker() async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );

    if (pickedDate != null &&
        HelperService().defaultDate(pickedDate) !=
            HelperService().defaultDate(DateTime.now())) {
      setState(() {
        date.text = HelperService().defaultDate(pickedDate);
      });
    }
  }

  
    Widget inputTimeSlot() {
    return TextFormField(
      controller: timeslot,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.star),
        hintText: 'Select Time Slot',
      ),
      keyboardType: TextInputType.text,
      readOnly: true,
      onTap: () => goToTimeSlotPage(),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please select time slot';
        }
        return null;
      },
    );
  }

  goToTimeSlotPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimeSlotPage(),
      ),
    );
    setState(() {
      selectedCategory = result;
      timeslot.text = selectedCategory['time'];
    });
  }
/*
  Widget inputPhoto() {
    if (photo.isEmpty) {
      return Container(
        color: Color.fromRGBO(230, 230, 230, 0.5),
        width: double.infinity,
        height: 150.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Icon(
                  Icons.camera_alt,
                  size: 36.0,
                  color: Colors.black54,
                ),
                onTap: () {
                  pickPhoto(ImageSource.camera);
                },
              ),
            ),
            VerticalDivider(
              thickness: 2.0,
            ),
            Expanded(
              child: GestureDetector(
                child: Icon(
                  Icons.photo_library,
                  size: 36.0,
                  color: Colors.black54,
                ),
                onTap: () {
                  pickPhoto(ImageSource.gallery);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Stack(
        children: <Widget>[
          Image.asset(
            photo,
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 60.0,
              height: 60.0,
              color: Colors.black54,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    photo = '';
                  });
                },
              ),
            ),
          ),
        ],
      );
    }
  }
*/
 /* void pickPhoto(ImageSource imgSource) async {
    showLoading = true;
    File file = await ImagePicker.pickImage(source: imgSource);
    if (photo != null) {
      setState(() {
        photo = file.path;
      });
    }
    showLoading = false;
  }
*/
  Widget saveButton(context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: RaisedButton(
        color: Colors.deepPurple,
        child: Text(
          'Save'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        onPressed: () {
          if (formKey.currentState.validate()) {
            Map form = {
       //       'amount': amount.text,
              'date': date.text,
              'category': selectedCategory,
         //     'photo': photo,
            };
            HelperService().showToast("Netball Court - Booking Confirmed!");
            Navigator.pop(context, form);
          } else {
            setState(() {
              autoValidate = true;
            });
          }
        },
      ),
    );
  }
}