import 'package:creampapa/screens/edit_product.dart';
import 'package:flutter/material.dart';
import '../material/model.dart';
import 'package:provider/provider.dart';

class ScreenBeta extends StatefulWidget {
  const ScreenBeta({Key? key}) : super(key: key);
  @override
  PriceSettings createState() => PriceSettings();
}

class PriceSettings extends State<ScreenBeta> {
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
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: Card(
                            child: ListTile(
                              title: Text(products[index].title),
                              subtitle: Text(
                                  "価格:${products[index].price}円 使用生地:${products[index].materialname}"),
                              // onTap: ,
                            ),
                          ),
                        );
                      });
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProduct()));
                },
                child: const Icon(Icons.add),
              ),
            )));
  }
}
