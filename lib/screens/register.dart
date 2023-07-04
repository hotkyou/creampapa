import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class CloseRegister extends StatefulWidget {
  const CloseRegister({Key? key}) : super(key: key);
  @override
  createState() => Register();
}

class Register extends State<CloseRegister> {
  final money = [10000, 5000, 2000, 1000, 500, 100, 50, 10, 5, 1];
  final count = List<int>.generate(1000, (i) => i);
  List<String> moneysheets = ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('精算処理'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Table(
            children: [
              for (int i = 0; i < money.length; i++)
                TableRow(children: [
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        money[i].toString(),
                        style: const TextStyle(fontSize: 20),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              moneysheets[i] =
                                  (int.parse(moneysheets[i]) - 1).toString();
                              setState(() {
                                moneysheets[i] = moneysheets[i];
                              });
                            },
                            icon: const Icon(Icons.remove)),
                        TextButton(
                          onPressed: () {
                            showPicker(context, i);
                          },
                          child: moneySelect(i),
                        ),
                        IconButton(
                            onPressed: () {
                              moneysheets[i] =
                                  (int.parse(moneysheets[i]) + 1).toString();
                              setState(() {
                                moneysheets[i] = moneysheets[i];
                              });
                            },
                            icon: const Icon(Icons.add)),
                      ]),
                ]),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Table(children: [
              TableRow(children: [
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      '合計',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      sumMoney().toString(),
                      style: const TextStyle(fontSize: 20),
                    )),
              ]),
            ]),
            Table(children: [
              TableRow(children: [
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      '残り',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      (sumMoney() - 100000).toString(),
                      style: const TextStyle(fontSize: 20),
                    )),
              ]),
            ]),
          ],
        ),
      ]),
    );
  }

  showPicker(BuildContext context, number) async {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(pickerData: count),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.blue),
        selectedTextStyle: const TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          //print(value.toString());
          //print(picker.getSelectedValues());
          setState(() {
            moneysheets[number] = picker.getSelectedValues()[0];
          });
        });
    picker.showBottomSheet(context);
  }

  moneySelect(number) {
    if (moneysheets[number] == "0") {
      return const Text('選択');
    } else {
      return Text(moneysheets[number]);
    }
  }

  sumMoney() {
    int sum = 0;
    for (int i = 0; i < moneysheets.length; i++) {
      sum += int.parse(moneysheets[i]) * money[i];
    }
    return sum;
  }
}
