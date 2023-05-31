import 'package:flutter/material.dart';

class ScreenAlpha extends StatelessWidget {
  const ScreenAlpha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ホーム'),
        ),
        body: const Center(
          child: Text(
            'ホーム',
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
