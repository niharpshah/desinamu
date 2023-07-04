import 'package:flutter/material.dart';

class ShowIncomePage extends StatelessWidget {
  final String type, taxmount, finalAmount, amount, kiwi;
  const ShowIncomePage({
    super.key,
    required this.type,
    required this.taxmount,
    required this.finalAmount,
    required this.amount,
    required this.kiwi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income after tax'),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Image(
                image: AssetImage('assets/logo.png'),
                width: 100.0,
                height: 100.0,
              ),
              ListTile(
                leading: Icon(Icons.work_outlined),
                title: Text(
                  type,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.monetization_on_sharp),
                title: Text(
                  amount,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.money_off_rounded),
                title: Text(
                  "-" + taxmount,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.savings),
                title: Text(
                  "-" + kiwi,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.money_rounded),
                title: Text(
                  finalAmount,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Go Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ShowIncomePage extends StatefulWidget {
//   const ShowIncomePage(
//       {super.key,
//       required this.type,
//       required this.taxmount,
//       required this.finalAmount,
//       required this.amount});
//   final String type, taxmount, finalAmount, amount;

//   // const ShowIncomePage(
//   //     Key key, this.type, this.taxmount, this.finalAmount, this.amount)
//   //     : super(key: key);

//   @override
//   State<ShowIncomePage> createState() => _ShowIncomePageState();
// }

// class _ShowIncomePageState extends State<ShowIncomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Income after tax'),
//       ),
//       body: Form(
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.all(50.0),
//               ),
//               Image(
//                 image: AssetImage('imanges/logo.png'),
//                 width: 100.0,
//                 height: 100.0,
//               ),
//               ListTile(
//                 leading: Icon(Icons.work_outlined),
//                 title: Text(type),
//               ),
//               ListTile(
//                 title: Text(taxmout),
//               ),
//               ListTile(
//                 title: Text(amount),
//               ),
//               ListTile(
//                 title: Text(finalAmount),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
