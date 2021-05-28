import 'package:bicycle/routes.dart';
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
      // home: MyHomePage(),
      initialRoute: Routes.getInitialRoute(),
      routes: Routes.routes,
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
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ボトムナビゲーション構築メソッド
  Widget _buildBottomNavigationBar() => BottomNavigationBar(
    currentIndex: currentIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'お気に入り',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'マップ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info_outline),
        label: 'お知らせ',
      ),
    ],
    onTap: (int index) {
      setState(() {
        currentIndex = index;
      });
    },
  );

}
