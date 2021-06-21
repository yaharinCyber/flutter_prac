import 'package:flutter/material.dart';
import 'package:flutter_prac/widget/navigation_drawer.dart';

void main() {
  runApp(CyberSiemApp());
}

class CyberSiemApp extends StatelessWidget {
  static final String title = 'CyberSIEM App 0.1';
  Widget build(BuildContext contex) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(CyberSiemApp.title),
          backgroundColor: Color.fromRGBO(51, 51, 51, 51),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Image.asset('1556852180374.png'),
          ],
        )));
  }
}
