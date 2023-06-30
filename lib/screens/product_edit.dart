import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);
  @override
  EditProductPage createState() => EditProductPage();
}

class EditProductPage extends State<EditProduct> {
  String product = "";
  String material = "";
  int price = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("商品登録"),
        ),
        body: Material(
            child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        enabled: true,
                        maxLength: 15,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: '商品名を入力してください', labelText: '商品名 *'),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '必須入力です';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          product = value!;
                        },
                      ),
                      TextFormField(
                        enabled: true,
                        maxLength: 15,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: '生地名を入力してください', labelText: '生地名 *'),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '必須入力です';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          material = value!;
                        },
                      ),
                      TextFormField(
                        enabled: true,
                        maxLength: 4,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: '商品価格を入力してください', labelText: '商品価格 *'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '必須入力です';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          price = int.parse(value!);
                        },
                      ),
                      ElevatedButton(
                          child: const Text('登録'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("登録中..."),
                              ));
                              final data = {
                                "material-name": material,
                                "name": product,
                                "price": price
                              };
                              FirebaseFirestore.instance
                                  .collection("product")
                                  .add(data);
                              Navigator.pop(context);
                            }
                          })
                    ],
                  ),
                ))));
  }
}
