import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Thanh Nhan",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 50),
          onPressed: () {
            setState(() {
              count++;
            });
          }),
      appBar: AppBar(
        title: Text('Trang chủ'),
        leading: Icon(Icons.home, size: 30),
      ),
      body: Center(child: Text(count == 0 ? "Xin chao cac ban." : "$count")),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        // khoảng cách floatingActionButton và bottomNavigation
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              iconSize: 35,
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              iconSize: 35,
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
            ),
            SizedBox(width: 40),
            IconButton(
              icon: Icon(Icons.call, color: Colors.white),
              iconSize: 35,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              iconSize: 35,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
