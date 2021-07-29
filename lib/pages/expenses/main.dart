import 'package:flutter/material.dart';
import 'package:simple_app/pages/expenses/create.dart';
import 'package:simple_app/pages/expenses/update.dart';
import 'package:simple_app/pages/login.dart';
import 'package:native_color/native_color.dart';
import 'package:simple_app/services/helper-service.dart';
import 'package:simple_app/services/storage-service.dart';


class MainExpensesPage extends StatefulWidget {
  final String userName;

  MainExpensesPage({this.userName});

  @override
  State<StatefulWidget> createState() {
    return MainExpensesState();
  }
}

class MainExpensesState extends State<MainExpensesPage> {
  List listExpenses = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GO - SUKAN'),
        centerTitle: true,
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
      body: Column(
        children: <Widget>[
          headerSection(),
          bodySection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          goToCreatePage();
          //
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void goToCreatePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateExpensesPage(),
      ),
    );

    print(result);

    if (result != null) {
      setState(() {
        listExpenses.insert(0, result);
        total = HelperService().countTotal(listExpenses);
        StorageService().saveData(listExpenses);
      });
    }
  }

    void goToUpdatePage(int index, Map transaction) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateExpensesPage(
          transaction: transaction
        ),
      ),
    );

    print(result);

    if (result != null) {
        listExpenses.removeAt(index);
        if(result != 'delete') {
          listExpenses.insert(index, result);
        }
        total = HelperService().countTotal(listExpenses);
        StorageService().saveData(listExpenses);
    }
  }

  Widget headerSection() {
    return Expanded(
      flex: 1,
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          color: Colors.deepOrange,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi! ' + widget.userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        //to show the total 
              Text(
                ' Total Spending is RM' + total.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodySection() {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        itemCount: listExpenses.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              num.parse(listExpenses[index]['amount']).toStringAsFixed(2),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            subtitle: Text(listExpenses[index]['date']),
            trailing: Card(
              color: HexColor(listExpenses[index]['category']['hex_color']),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  listExpenses[index]['category']['name'],
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                  ),
                ),
              ),
            ),
            onTap: () => goToUpdatePage(index, listExpenses[index]),
          );
        },
      ),
    );
  }
}
