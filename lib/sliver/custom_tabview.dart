import 'dart:collection';

import 'package:flutter/material.dart';

class CustomTabWidget extends StatefulWidget {
   const CustomTabWidget({super.key});

  @override
  State<CustomTabWidget> createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> with SingleTickerProviderStateMixin{
  final List<String> tabTitles = ["首页", "体育赛事", "周杰伦"];
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: tabTitles.length, vsync: this);
    super.initState();
  }

  Widget _tabsView() {
    return TabBar(
      labelColor: Colors.black54,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.cyan,
      controller: _controller,
        tabs: tabTitles.map((e) => Tab(text: e)).toList()
    );
  }

  Widget _bodyView() {
    return TabBarView(
      controller: _controller,
        children: List.generate(tabTitles.length, (index) {
      return ListView.builder(
        itemBuilder: (context, itemIndex) {
          return Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.withOpacity(0.3),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 3.0)]),
            child: Text("${tabTitles[index]} $itemIndex"),
          );
        },
        itemCount: 10 * index + 3,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomTabWidget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //TabBar 需要包裹 PreferredSize 组件才能展示
          PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: _tabsView(),
          ),
          Expanded(
            flex: 1,
            child: _bodyView()
          )
        ],
      )
    );
  }
}
