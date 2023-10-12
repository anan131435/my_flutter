import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/shop/entity/collection_list_model.dart';
import 'package:flutter_tips/provider/shop/entity/shop_entity.dart';
import 'package:provider/provider.dart';
class CollectionButton extends StatelessWidget {
  const CollectionButton({super.key,required this.shop});
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    CollectionListModel collectionListModel = Provider.of<CollectionListModel>(context);
    bool contains = collectionListModel.shops.contains(shop);
    log("CollectionButton build");
    return InkWell(
      onTap: contains ? () => collectionListModel.removeShops(shop) : () => collectionListModel.addShops(shop),
      child: SizedBox(
        width: 60,
        height: 60,
        child: contains ? const Icon(Icons.favorite,color: Colors.redAccent) : const Icon(Icons.favorite,color: Colors.tealAccent),
      ),
    );
  }
}
