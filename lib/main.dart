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
      debugShowCheckedModeBanner: false,
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
  static String title = '駐輪場探訪';
  static int currentIndex = 1;
  bool _isVisibleFab = true;
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
      floatingActionButton: _buildFloatingActionButton(),
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
            if(currentIndex == 1) {
              _isVisibleFab = true;
            } else {
              _isVisibleFab = false;
            }
          });
        },
      ),
    );
  }

  // FAB構築メソッド
  Widget _buildFloatingActionButton() => Visibility(
    visible: _isVisibleFab,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            print('新規追加ダイアログ表示');
          },
          child: Icon(Icons.add_location),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal:8, vertical: 16),
          child: FloatingActionButton(
            onPressed: () {
              print('現在地に遷移');
            },
            child: Icon(Icons.my_location),
          ),
        ),
      ],
    ),
  );
}
