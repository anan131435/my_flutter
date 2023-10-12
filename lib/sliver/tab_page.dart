import 'package:flutter/material.dart';
class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final _tabTitles = [
    "首页",
    "本地热门",
    "阿富汗"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabTitles.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("DefaultTabController"),
            centerTitle: true,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
                tabs: _tabTitles.map((e) => Tab(text: e))
                    .toList()
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 89,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blueGrey
                  ),
                  alignment: Alignment.center,
                  child: Text("Item is $index"),
                );
              },
                itemCount: 100,
              ),
              ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 89,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.teal
                  ),
                  child: Text("Item is $index"),
                );
              },
                itemCount: 100,
              ),
              ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 89,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.tealAccent
                  ),
                  child: Text("Item is $index"),
                );
              },
                itemCount: 100,
              ),
            ],
          )
        )
    );
  }
}
