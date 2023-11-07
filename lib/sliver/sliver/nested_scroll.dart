import 'package:flutter/material.dart';

class HZNestedScrollView extends StatelessWidget {
  const HZNestedScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text("嵌套ListView"),
              pinned: true,
              forceElevated: innerBoxIsScrolled,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: Colors.blue,
                    height: 60,
                    alignment: Alignment.center,
                    child: Text("Current Index is $index"),
                  );
                },
                childCount: 20,
              ),
            )
          ];
        },
        body: ListView.builder(
          itemBuilder: (context, index) {
            return SizedBox(height: 50, child: Text('Item $index'));
          },
          itemCount: 30,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
