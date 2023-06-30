import 'package:flutter/material.dart';

class EditMaterial extends StatefulWidget {
  const EditMaterial({super.key});

  @override
  EditMaterialPage createState() => EditMaterialPage();
}

class EditMaterialPage extends State<EditMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("生地登録"),
      ),
      body: const Material(
        child: Text("test"),
      ),
    );
  }
}
