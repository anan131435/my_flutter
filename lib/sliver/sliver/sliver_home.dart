import 'package:flutter/material.dart';

import 'large_header.dart';
class SLiverMainPage extends StatefulWidget {
  const SLiverMainPage({super.key});

  @override
  State<SLiverMainPage> createState() => _SLiverMainPageState();
}

class _SLiverMainPageState extends State<SLiverMainPage> {
  List<String> dataSource = [
    "头部大图"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliver 入口"),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SnapAppBar()));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: (index < dataSource.length) ?  Text(dataSource[index]) : const Text("越界了"),
          ),
        );
      },
        itemCount: dataSource.length,
      ),
    );
  }
}
