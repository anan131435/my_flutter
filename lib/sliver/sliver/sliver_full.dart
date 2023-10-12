import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverFullPage extends StatefulWidget {
  const SliverFullPage({super.key});

  @override
  State<SliverFullPage> createState() => _SliverFullPageState();
}

class _SliverFullPageState extends State<SliverFullPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverFullPage"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPinnedHeader(
              child: Container(
                color: Colors.blue,
                height: 100,
                child: const Text("I am Pinned Header", style:  TextStyle(fontSize: 30)),
              )
          ),
          // SliverAnimatedPaintExtent(
          //   duration: const Duration(milliseconds: 150),
          //   child: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //           (BuildContext context, int index) {
          //         return Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: Container(
          //             color: Colors.pink[100],
          //             height: 40,
          //             alignment: Alignment.center,
          //             child: Text(
          //               "$index",
          //               style: const TextStyle(fontSize: 30),
          //             ),
          //           ),
          //         );
          //       },
          //       // 40 list items
          //       childCount: 10,
          //     ),
          //   ),
          // ),
          SliverStack(
            insetOnOverlap: true,
              children: [
                SliverPositioned.fill(child: Container(color: Colors.yellow)),
                SliverList(delegate:
                SliverChildBuilderDelegate((context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                    color: index % 2 == 0 ? Colors.green : Colors.greenAccent,
                        height: 90,
                        alignment: Alignment.center,
                        child: Text("Item $index",style: const TextStyle(fontSize: 30)),
                  )
                  );
                },
                  childCount: 10
                ),
                ),
              ]
          ),
          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1
              ),
              delegate: SliverChildBuilderDelegate((context, index) => Container(
                height: 90,
                color: Colors.amber[100],
                alignment: Alignment.center,
                child: Text(index.toString()),
              ),
                  childCount: 40
              )
          )
        ],
      ),
    );
  }
}
