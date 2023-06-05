import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('今日の売り上げ予測'),
        ),
        body: const Center(
          child: Text(
            'home',
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
