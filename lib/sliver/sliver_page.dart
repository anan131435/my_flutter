import 'package:flutter/material.dart';
class SliverTabPage extends StatefulWidget {
  const SliverTabPage({super.key});

  @override
  State<SliverTabPage> createState() => _SliverTabPageState();
}

class _SliverTabPageState extends State<SliverTabPage> with SingleTickerProviderStateMixin{
  late TabController _controller;
  final List<String> tabTitles = [
    "首页",
    "周杰伦",
    "视频合机"
  ];
  @override
  void initState() {
    _controller = TabController(length: tabTitles.length, vsync: this);
    _controller.addListener(() {

    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 240.0,
              snap: false,
              pinned: true,
              elevation: 0.5,
              forceElevated: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                // title: const Text("Sliver"),
                background: Container(
                  height: 210.0,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.asset("assets/girl.jpeg",fit: BoxFit.cover),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(-6),
                child: TabBar(
                  indicatorColor: Colors.orangeAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.all(4),
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  controller: _controller,
                    tabs: tabTitles.map((e) => Tab(text: e)).toList()
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _controller,
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.teal,
                child: const Text("One"),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.tealAccent,
                child: const Text("Two"),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.redAccent,
                child: const Text("Three"),
              ),
            ])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print(_controller.index);
          _controller.animateTo(2);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
