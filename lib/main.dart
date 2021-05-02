import 'package:flutter/material.dart';
import 'package:bicycle/screens/favorite.dart';
import 'package:bicycle/screens/map.dart';
import 'package:bicycle/screens/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '駐輪所探訪',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = '駐輪場探訪';
  int currentIndex = 1;
  List<Widget> _screens = [
    Favorite(),
    Map(),
    Info(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('お気に入り'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('マップ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('お知らせ'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
