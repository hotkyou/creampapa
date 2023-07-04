import 'package:creampapa/screens/product_edit.dart';
import 'package:flutter/material.dart';
import '../material/model.dart';
import 'package:provider/provider.dart';
import 'material_edit.dart';

class ScreenBeta extends StatefulWidget {
  const ScreenBeta({Key? key}) : super(key: key);
  @override
  PriceSettings createState() => PriceSettings();
}

class PriceSettings extends State<ScreenBeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('生地価格設定'),
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
        body: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData.dark(),
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
                ))));
  }
}
