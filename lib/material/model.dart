import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。
  List<Products> products = [];

  Future<void> fetchProducts() async {
    // Firestoreからコレクション'books'(QuerySnapshot)を取得してdocsに代入。
    final docs = await FirebaseFirestore.instance.collection('product').get();

    // getter docs: docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
    // map(): Listの各要素をBookに変換
    // toList(): Map()から返ってきたIterable→Listに変換する。
    final products = docs.docs.map((doc) => Products(doc)).toList();
    this.products = products;
    notifyListeners();
  }
}

// firestoreのドキュメントを扱うクラスBookを作る。
class Products {
  // ドキュメントを扱うDocumentSnapshotを引数にしたコンストラクタを作る
  Products(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
    title = doc['name'];
    materialname = doc['material-name'];
    price = doc['price'];
  }
  // Bookで扱うフィールドを定義しておく。
  String title = "";
  String materialname = "";
  int price = 0;
}
