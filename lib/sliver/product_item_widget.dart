import 'package:flutter/material.dart';

import 'product_item.dart';

class ProductItemWidget extends StatelessWidget {
  ProductItem item;
  ProductItemWidget({required Key key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: 73,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 55,
              height: 73,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.yellow,
              ),
              child: Image.network(
                "https://img1.baidu.com/it/u=3593114214,976018682&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(item.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                const SizedBox(height: 4,),
                // Text(item.author,style: TextStyle(fontSize: 14,color: ColorsUtil.contractColor("#A6A6A6"))),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
