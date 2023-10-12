import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/shop/widget/collection_button.dart';
import 'package:flutter_tips/provider/shop/entity/shop_entity.dart';
class ShopItem extends StatelessWidget {
  const ShopItem({super.key, required this.shop});
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    log("ShopItem build");
    return ListTile(
      leading: CircleAvatar(
        child: Text("${shop.id}"),
      ),
      title: Text(shop.name,style: const TextStyle(fontSize: 17)),
      trailing: CollectionButton(shop: shop),
    );
  }
}
