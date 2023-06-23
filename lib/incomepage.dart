import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final GlobalKey<FormState> _informKey = GlobalKey<FormState>();
  late String _type, taxmount = "", finalAmount = "";
  late String _amount = "";
  late bool _autovalid = false;

  addIncomeData() {
    if (_informKey.currentState!.validate()) {
      // Save Data in Global Key
      _informKey.currentState?.save();
      // Send to Next Screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertDialog(
            content: Text(
              _amount,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            title: Text(
              _type,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showincomeafterTax();
                },
                child: Text('Ok Got It..!!'),
              ),
            ],
          ),
        ),
      ).then((_) => _informKey.currentState?.reset());
    } else {
      setState(() {
        _autovalid = true;
        // showError("errorMessage");
      });
    }
  }

  // Show income after tax
  showincomeafterTax() {
    if (_amount!.isNotEmpty) {
      int amountDouble = int.parse(_amount);
      taxmount = (amountDouble - (amountDouble * 17 / 100)).toString();
      // finalAmount = (amountDouble - taxmount).toString();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlertDialog(
            title: Text('Tax on Income'),
            content: Text(
              taxmount,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        ),
      );
    } else {
      setState(() {
        _autovalid = true;
      });
    }
  }

  // Table for save detailed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _informKey,
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
                          padding:
                              EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
                        ),
                        onPressed: addIncomeData,
                        child: Text(
                          'Add Income',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // TODO: Navigate to Table from Income Page
                  ],
                ),
              ),
            ),
            Card(
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
                      'Income after Tax',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.monetization_on_outlined),
                          title: Text(taxmount),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
