import 'package:flutter/material.dart';
import 'package:flutter_tips/basic/tab_home.dart';
import 'package:flutter_tips/basic/tab_position.dart';
import 'package:flutter_tips/basic/tab_rank.dart';
class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        IconButton(onPressed: () => print("object"),  icon: const Icon(Icons.menu)),
        IconButton(onPressed: () => print("close"), icon: const Icon(Icons.close_sharp)),
      ],
    );
  }
  final _tabs = [
    "组织架构",
    "组织管理",
    "岗位管理",
    // "岗位架构",
    // "职级管理",
    // "职位管理",
  ];
  late TabController _tabController;
  final _pages = const [
    TabHomePage(),
    TabPosition(),
    TabRankPage(),
  ];
  @override
  void initState() {
    _tabController = TabController(length: _tabs.length,vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TabPageState Loose"),
        ),
        body: Column(
          children: [
            _header(),
            TabBar(tabs: _tabs.map((e) => Tab(text: e,)).toList(),
            controller: _tabController,
            ),
            Expanded(child: TabBarView(controller: _tabController,children: _pages)),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
