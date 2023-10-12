import 'package:flutter/widgets.dart';
import 'package:flutter_tips/provider/shop/entity/list_entity.dart';
import 'package:flutter_tips/provider/shop/entity/shop_entity.dart';

class CollectionListModel extends ChangeNotifier {
  final ListModel _listModel;
  CollectionListModel(this._listModel);
  List<Shop> shops = [];
  void addShops(Shop shop) {
    shops.add(shop);
    notifyListeners();
  }
  void removeShops(Shop shop) {
    shops.remove(shop);
    notifyListeners();
  }
}