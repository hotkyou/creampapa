import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('設定'),
        ),
        body: const Center(
          child: Text(
            'ホーム',
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
