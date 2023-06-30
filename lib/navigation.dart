import 'package:flutter/material.dart';

import 'package:creampapa/screens/home.dart';
import 'package:creampapa/screens/register.dart';
import 'package:creampapa/screens/material_list.dart';
import 'package:creampapa/screens/setting.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const _screens = [
    HomeScreen(), //お知らせ
    ScreenBeta(), //生地計算
    CloseRegister(), //精算処理
    SettingScreen(), //設定
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'お知らせ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.query_stats), label: '生地計算'),
            BottomNavigationBarItem(
                icon: Icon(Icons.point_of_sale), label: '精算処理'),
            BottomNavigationBarItem(icon: Icon(Icons.tune), label: '設定'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
