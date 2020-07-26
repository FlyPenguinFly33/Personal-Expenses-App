import 'package:flutter/material.dart';

import "./widgets/new_transaction.dart";
import "./models/transaction.dart";
import "./widgets/transaction_list.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.blue[900],
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: deprecated_member_use
                title: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //String titleInput, amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'T1',
    //   title: "New Shoes",
    //   amount: 49.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'T2',
    //   title: "Groceries",
    //   amount: 150,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'T3',
    //   title: "MacBook Air",
    //   amount: 1250,
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTX = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString() + amount.toString(),
    );

    setState(() {
      _userTransactions.add(newTX);
    });

    print(
      "Debugger --> New TX is added! --> " + title + "-" + amount.toString(),
    );
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(addTX: _addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  "*CHART*",
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).primaryColorDark,
                elevation: 5,
              ),
            ),
            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
    );
  }
}
