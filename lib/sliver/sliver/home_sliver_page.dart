import 'dart:developer';

import 'package:flutter/material.dart';
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
              itemCount: 40,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          const Text("GridView",style: TextStyle(fontSize: 30)),
          const SizedBox(height: 10),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                // log("GridView $index");
              },
              child: Container(
                color: Colors.pink,
                alignment: Alignment.center,
                child: Text("GridView $index",style: const TextStyle(fontSize: 20)),
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 30,
          )
        ],
      ),
    );
  }
}
