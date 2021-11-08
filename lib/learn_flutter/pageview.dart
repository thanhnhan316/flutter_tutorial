import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/page/profile.dart';
import 'package:hello_world/service/service.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pageview(),
    );
  }
}

class Pageview extends StatefulWidget {
  const Pageview({Key? key}) : super(key: key);

  @override
  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  late Size size;
  int selectedIndex = 0;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: false,
      body: PageView(
        controller: pageController,
        children: [
          Center(child: Text("Home")),
          Center(child: Text("Search")),
          Center(child: Text("download")),
          ProfileScreen()
        ],
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.yellow[800],
        unselectedItemColor: Colors.grey,
        iconSize: 37,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            pageController.animateToPage(selectedIndex,
                duration: Duration(microseconds: 200), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
