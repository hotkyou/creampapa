import 'package:creampapa/screens/material_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class CloseRegister extends StatefulWidget {
  const CloseRegister({Key? key}) : super(key: key);
  @override
  createState() => Register();
}

class Register extends State<CloseRegister> {
  static const money = [
    '10000',
    '5000',
    '2000',
    '1000',
    '500',
    '100',
    '50',
    '10',
    '5',
    '1'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('精算処理'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditMaterial()));
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Table(
          children: [
            for (String money in money)
              TableRow(children: [
                Text(money),
                TextButton(
                  onPressed: () {
                    showPicker(context);
                  },
                  child: const Text('選択'),
                ),
              ]),
          ],
        ),
      ),
    );
  }

  showPicker(BuildContext context) async {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(pickerData: money),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.blue),
        selectedTextStyle: const TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.showBottomSheet(context);
  }
}
