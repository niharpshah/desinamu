import 'package:flutter/material.dart';
import 'menulist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenuList> menu = [
    MenuList("Income", Colors.teal, "/a"),
    MenuList("Expenses", Colors.blue, "/b"),
    MenuList("Balances", Colors.deepOrange, "/c"),
    MenuList("Goals", Colors.blueGrey, "/d"),
    MenuList("Transaction", Colors.purple, "/e"),
    MenuList("Reports", Colors.lightBlue, "/f"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desi Namu'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("assets/logo.png"),
                height: 100.0,
                width: 100.0,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: menu.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: menu[i].buttonColor,
                      ),
                      child: Text(menu[i].buttonText),
                      onPressed: () {
                        Navigator.pushNamed(context, menu[i].buttonNavigate);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
