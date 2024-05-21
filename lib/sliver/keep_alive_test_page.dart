import 'package:flutter/material.dart';
import 'package:flutter_tips/sliver/keep_alive_page.dart';

class KeepAliveTestPage extends StatelessWidget {
  const KeepAliveTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("自动缓存"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return KeepAliveWrapper(
            keepAlive: true,
            child: ListItem(index: index,),
          );
        },
        itemCount: 100,
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final int index;
  const ListItem({super.key,required this.index});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(title:Text('${ widget.index}'));
  }
  @override
  void dispose() {
    print("dispose item ${widget.index}");
    super.dispose();
  }
}
