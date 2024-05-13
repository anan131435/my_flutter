import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  final int index;
  const GridItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = (screenWidth - 30) / 2;
    print("screenWidth: $screenWidth, itemWidth: $itemWidth");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink[100],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://img1.baidu.com/it/u=4122344780,2704161739&fm=253&fmt=auto&app=138&f=JPEG?w=650&h=488",
                width: itemWidth * 0.5,
                height: itemWidth ,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8, top: 9),
                  child: Text(
                    "周杰伦",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text("青花瓷---$index"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
