import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/shop/entity/collection_list_model.dart';
import 'package:flutter_tips/provider/shop/widget/shop_item.dart';
import 'package:provider/provider.dart';

import '../entity/shop_entity.dart';
class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // CollectionListModel listModel = Provider.of<CollectionListModel>(context);
    // List<Shop> shops = listModel.shops;
    CollectionListModel listModel = context.read<CollectionListModel>();
    List<Shop> shops = listModel.shops;
    log("CollectionPage build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏列表"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => ShopItem(shop: shops[index]),
        itemCount: shops.length,
      ),
    );
  }
}
