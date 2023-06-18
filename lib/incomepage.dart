import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name, _money;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
      ),
      body: Container(
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
                    child: Text(
                      'Income Form',
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
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Provide an Email';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onSaved: (input) => _name = input!,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              obscureText: true,
                              validator: (input) {
                                if (input!.length < 6) {
                                  return 'Password Should be atleast 6 character';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Type of Work',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onSaved: (input) => _money = input!,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
