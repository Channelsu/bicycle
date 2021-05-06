import 'package:bicycle/routes.dart';
import 'package:bicycle/screens/spot_form.dart';
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
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // FAB構築メソッド
  Widget _buildFloatingActionButton() => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      if (currentIndex == 1) FloatingActionButton(
        heroTag: 'add_location',
        child: Icon(Icons.add_location),
        onPressed: () async {
          await Navigator.pushNamed(context, Routes.spotForm,);
        },
      ),
      if (currentIndex == 1) Container(
        margin: EdgeInsets.symmetric(horizontal:8, vertical: 16),
        child: FloatingActionButton(
          heroTag: 'my_location',
          child: Icon(Icons.my_location, color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          onPressed: () {
            print('現在地に遷移');
          },
        ),
      ),
    ],
  );

  //
  createFormDialog() {
    
  }

  // ボトムナビゲーション構築メソッド
  Widget _buildBottomNavigationBar() => BottomNavigationBar(
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
  );

}
