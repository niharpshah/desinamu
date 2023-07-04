import 'balance.dart';
import 'goals.dart';
import 'reports.dart';
import 'transactions.dart';
import 'package:flutter/material.dart';
import 'expensepage.dart';
import 'homepage.dart';
import 'incomepage.dart';
import 'screens/showincome.dart';

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
      // Change home page to HomePage()
      home: IncomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => IncomePage(),
        "/b": (BuildContext context) => ExpensePage(),
        "/c": (BuildContext context) => BalancePage(),
        "/d": (BuildContext context) => GoalsPage(),
        "/e": (BuildContext context) => TransactionPage(),
        "/f": (BuildContext context) => ReportPage(),
      },
    );
  }
}
