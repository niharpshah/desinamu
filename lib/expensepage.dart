import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  GlobalKey<FormState> _exformkey = GlobalKey<FormState>();
  late String _type, _amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _exformkey,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  child: Text(
                    'Expense Form',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Image(
                  //   image: AssetImage("assets/logo.png"),
                  //   width: 100.0,
                  //   height: 100.0,
                  // ),
                ),
                // Textbox for Type of Work

                ListTile(
                  leading: Icon(Icons.list_alt),
                  title: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter Type';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Type of work'),
                    onSaved: (input) => _type = input!,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter Amount';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Amount'),
                    onSaved: (input) => _amount = input!,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20.0, 0, 40.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add Expenses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Navigate to Table from Income Page
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: ElevatedButton(
                      child: Text('List of previous income'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.shade200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
