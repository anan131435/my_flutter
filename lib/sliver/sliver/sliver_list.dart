import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: CustomScrollView(
          slivers: [
            SliverPinnedHeader(
              child: Container(
                color: Colors.yellow,
                height: 100,
                child: const Text(
                  "I am Pinned Header",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          color: index % 2 == 0 ? Colors.green : Colors.greenAccent,
                          height: 80,
                          alignment: Alignment.center,
                          child: Text("Item $index", style: const TextStyle(fontSize: 30)),
                        ),
                      ),
                  childCount: 40),
            )
          ],
        ),
      ),
    );
  }
}
