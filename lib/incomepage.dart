import 'package:flutter/material.dart';
import 'screens/showincome.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  late String type,
      taxmount = "",
      finalAmount = "",
      amount = "",
      kiwisaver = "";
  late bool _autovalid = false;

  // Show income after tax
  showincomeafterTax() {
    if (type!.isNotEmpty && type == "z" || type == "Z") {
      if (amount!.isNotEmpty) {
        double amountDouble = double.parse(amount);
        amount = amountDouble.toStringAsFixed(2);
        taxmount = (amountDouble * 17 / 100).toStringAsFixed(2).toString();
        finalAmount = (amountDouble -
                (amountDouble * 17 / 100) -
                (amountDouble * 3 / 100))
            .toStringAsFixed(2)
            .toString();
        kiwisaver = (amountDouble * 3 / 100).toStringAsFixed(2).toString();
      } else {
        setState(() {
          _autovalid = true;
        });
      }
    } else {
      if (amount!.isNotEmpty) {
        double amountDouble = double.parse(amount);
        amount = amountDouble.toStringAsFixed(2);
        taxmount = (amountDouble * 0 / 100).toStringAsFixed(2).toString();
        finalAmount =
            (amountDouble - (amountDouble * 0 / 100) - (amountDouble * 0 / 100))
                .toStringAsFixed(2)
                .toString();
        kiwisaver = (amountDouble * 0 / 100).toStringAsFixed(2).toString();
      } else {
        setState(() {
          _autovalid = true;
        });
      }
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
              key: _key,
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
                        onSaved: (input) => type = input!,
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
                        onSaved: (input) => amount = input!,
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
                        onPressed: () {
                          _SendNextScreen();
                          showincomeafterTax();
                        },
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
          ],
        ),
      ),
    );
  }

  _SendNextScreen() {
    if (_key.currentState!.validate()) {
      // Save Data in Global Key
      _key.currentState?.save();
      // Send to next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowIncomePage(
            type: type,
            taxmount: taxmount,
            finalAmount: finalAmount,
            amount: amount,
            kiwi: kiwisaver,
          ),
        ),
      ).then((_) => _key.currentState?.reset());
    } else {
      setState(() {
        _autovalid = true;
      });
    }
  }
}
