import 'package:flutter/material.dart';

class ScreenBeta extends StatelessWidget {
  const ScreenBeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('スクリーンベータ'),
        ),
        body: const Center(
          child: Text(
            'screen_beta',
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
