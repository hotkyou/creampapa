import 'package:flutter/material.dart';

class ScreenAlpha extends StatelessWidget {
  const ScreenAlpha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('生地計算'),
        ),
        body: const Center(
          child: Text(
            'screen_alpha',
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
