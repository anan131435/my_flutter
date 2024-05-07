import 'package:flutter/material.dart';
import 'package:flutter_tips/sliver/product_item_widget.dart';

import 'product_item.dart';
class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductItem> itemList = [
      ProductItem("王者荣耀", "img", "腾讯"),
      ProductItem("吃鸡", "img", "ali"),
      ProductItem("原神", "img", "腾讯"),
      ProductItem("王者荣耀", "img", "iOS"),
      ProductItem("吃鸡", "img", "Android"),
      ProductItem("原神", "img", "Flutter"),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GridView"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 155 / 73 ,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ), itemBuilder: (context, index) {
          final item = itemList[index];
          return ProductItemWidget(key: UniqueKey(), item: item);
        },
          itemCount: itemList.length,
        ),
      ),
    );
  }
}
