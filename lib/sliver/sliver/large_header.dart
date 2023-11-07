import 'package:flutter/material.dart';
class SnapAppBar extends StatelessWidget {
  const SnapAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                expandedHeight: 200,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset("assets/girl.jpeg",fit: BoxFit.cover),
                ),
              ),
            )
          ];
        },
        body: ListView.builder(itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Icon( (index % 2 == 0) ? Icons.add : Icons.add_call),
          );
        },),
      ),
    );
  }
}
