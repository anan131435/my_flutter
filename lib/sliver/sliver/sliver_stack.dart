import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
class SliverStackWidget extends StatelessWidget {
  const SliverStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverStack"),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: CustomScrollView(
          slivers: [
            SliverStack(
            insetOnOverlap: true,
            children: [
              SliverPositioned.fill(
                  child: Container(color: Colors.yellow)
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          color: index % 2 == 0 ? Colors.green : Colors.greenAccent,
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "Item $index",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      childCount: 40
                  )
              )
            ]
        ),
          ],
        ),
      ),
    );
  }
}
