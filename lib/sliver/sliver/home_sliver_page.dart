import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tips/sliver/sliver/grid_item.dart';
class SliverHomePage extends StatelessWidget {
  const SliverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Text("ListView",style: TextStyle(fontSize: 30)),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.orange
              ),
                alignment: Alignment.center,
                child: Text('ListView Item $index'),
            ),
            ),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          const Text("GridView",style: TextStyle(fontSize: 30)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9/10
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  log("GridView $index");
                },
                child: GridItemWidget(index: index,),
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
