import 'dart:math';

import 'package:flutter/material.dart';
class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverGridWidget"),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: true,
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1/1
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 40,
                    (context, index) => InkWell(
                      onTap: () {
                        // log(index);
                          print(index);

                      },
                      child: Container(
                  height: 40,
                  color: Colors.amber[100],
                  alignment: Alignment.center,
                  child: Text(index.toString()),
                ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
