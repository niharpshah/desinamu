import 'balance.dart';
import 'goals.dart';
import 'reports.dart';
import 'transactions.dart';
import 'package:flutter/material.dart';
import 'expensepage.dart';
import 'homepage.dart';
import 'incomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Desi Namu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext conxt) => IncomePage(),
        "/b": (BuildContext conxt) => ExpensePage(),
        "/c": (BuildContext conxt) => BalancePage(),
        "/d": (BuildContext conxt) => GoalsPage(),
        "/e": (BuildContext conxt) => TransactionPage(),
        "/f": (BuildContext conxt) => ReportPage(),
      },
    );
  }
}
