import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/shop/entity/list_entity.dart';
import 'package:flutter_tips/provider/shop/entity/shop_entity.dart';
import 'package:flutter_tips/provider/shop/widget/shop_item.dart';
import 'package:provider/provider.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ListModel listModel = Provider.of<ListModel>(context);
    // List<Shop> shops = listModel.shops;
    ListModel listModel = context.watch<ListModel>();
    List<Shop> shops = listModel.shops;
    log("ShopListPage build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品列表"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ShopItem(shop: shops[index]),
        itemCount: shops.length,
      ),
    );
  }
}
