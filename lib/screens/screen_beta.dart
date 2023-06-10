import 'package:flutter/material.dart';
import '../material/model.dart';
import 'package:provider/provider.dart';

class ScreenBeta extends StatefulWidget {
  const ScreenBeta({Key? key}) : super(key: key);
  @override
  _PriceSettings createState() => _PriceSettings();
}

class _PriceSettings extends State<ScreenBeta> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<MainModel>(
            create: (_) => MainModel()..fetchProducts(),
            child: Scaffold(
              body: Consumer<MainModel>(
                builder: (context, model, child) {
                  final products = model.products;
                  return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {
                              products.removeAt(index);
                            });
                          },
                          background: Container(
                            color: Colors.red,
                          ),
                          child: Card(
                            child: ListTile(
                              title: Text(products[index].title),
                              subtitle: Text(
                                  "価格:${products[index].price}円 使用生地:${products[index].materialname}"),
                            ),
                          ),
                        );
                      });
                },
              ),
            ))

        // ListView.builder(
        //   itemCount: _list.length,
        //   itemBuilder: (context, index) {
        //     return Dismissible(
        //       key: UniqueKey(),
        //       onDismissed: (direction) {
        //         setState(() {
        //           _list.removeAt(index);
        //         });
        //       },
        //       background: Container(
        //         color: Colors.red,
        //       ),
        //       child: Card(
        //         child: ListTile(
        //           title: Text(_list[index]),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
