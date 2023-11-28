import 'package:flutter/material.dart';
class ContractListPage extends StatefulWidget {
   const ContractListPage({super.key});

  @override
  State<ContractListPage> createState() => _ContractListPageState();
}

class _ContractListPageState extends State<ContractListPage> with SingleTickerProviderStateMixin{
  final _tabsTitle = [
    "首页",
    "商城",
    "精选视频"
  ];

  late TabController _tabController;
@override
  void initState() {
    _tabController = TabController(length: _tabsTitle.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _tabView() {
    return PreferredSize(
        preferredSize: const Size(double.infinity,44),
        child: TabBar(
          controller: _tabController,
          tabs: _tabsTitle.map((e) => Tab(text: e,)).toList(),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("合同列表"),
      ),
      body: Column(
        children: [
          _tabView(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Theme.of(context).primaryColor,width: 0.5,),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Text("我是标题$index",style: const TextStyle(fontSize: 45),),
                      Text("我是二级标题$index+++",style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                );
              },
                itemCount: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
