import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_app/services/helper-service.dart';
import 'package:simple_app/pages/category.dart';


class UpdateExpensesPage extends StatefulWidget {
  final Map transaction;

  UpdateExpensesPage({this.transaction});

  @override
  State<StatefulWidget> createState() {
    return UpdateExpensesState();
  }
}

class UpdateExpensesState extends State<UpdateExpensesPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  bool showLoading = false;

  TextEditingController amount = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController date = TextEditingController(
    text: HelperService().defaultDate(
      DateTime.now(),
    ),
  );

  String photo = '';
  Map selectedCategory;

  @override
  void initState() {
    super.initState();

    setState(() {
      amount.text = widget.transaction['amount'];
      category.text = widget.transaction['category']['name'];
      date.text = widget.transaction['date'];
      if (widget.transaction['photo'].toString().isNotEmpty) {
        photo = widget.transaction['photo'];
      }
      selectedCategory = widget.transaction['category'];
    });
  }

  @override
  void dispose() {
    amount.dispose();
    category.dispose();
    date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmToDelete(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          autovalidate: autoValidate,
          child: Column(
            children: <Widget>[
              inputAmount(),
              SizedBox(height: 10.0),
              inputCategory(),
              SizedBox(height: 10.0),
              inputDate(),
              SizedBox(height: 10.0),
              showLoading == false ? inputPhoto() : CircularProgressIndicator(),
              SizedBox(height: 20.0),
              saveButton(context),
            ],
          ),
        ),
      ),
    );
  }

 /* Future confirmToDelete(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context2) {
        return AlertDialog(
          title: Text("Confirm To Delete?"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "This transaction will be deleted",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Yes'.toUpperCase(),
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
              ),
              onPressed: () {
                Navigator.of(context2).pop();
                Navigator.pop(context, 'delete');
              },
            ),
            FlatButton(
              child: Text(
                'Cancel'.toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/

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

  confirmToDelete(BuildContext context ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context2) {
        return AlertDialog(
          title: Text('Confirm To Delete?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This expenses will be deleted'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'.toUpperCase()),
              onPressed: () {
                HelperService().showToast("Expenses has been deleted");
                Navigator.pop(context2);
                Navigator.pop(context, 'delete');
              },
            ),
            FlatButton(
              child: Text('No'.toUpperCase()),
              onPressed: () {
                Navigator.pop(context2);
              },
            ),
          ],
        );
      } );
  }

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

  void pickPhoto(ImageSource imgSource) async {
    showLoading = true;
    File file = await ImagePicker.pickImage(source: imgSource);
    if (photo != null) {
      setState(() {
        photo = file.path;
      });
    }
    showLoading = false;
  }

  Widget saveButton(context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: RaisedButton(
        color: Colors.green,
        child: Text(
          'Save'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        onPressed: () {
          if (!autoValidate) {
            formKey.currentState.validate();
            Map _transaction = {
              'amount': amount.text,
              'date': date.text,
              'category': selectedCategory,
              'photo': photo,
            };
            Navigator.pop(context, _transaction);
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