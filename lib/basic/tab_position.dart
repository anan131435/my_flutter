import 'package:flutter/material.dart';
class TabPosition extends StatefulWidget {
  const TabPosition({super.key});

  @override
  State<TabPosition> createState() => _TabPositionState();
}

class _TabPositionState extends State<TabPosition> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.blue,
      child: TextField(),
    );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            child:  Text(
              "Home_Position_$index",
              style: const  TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          );
        },
        itemCount: 100,
      ),
    );
  }
}
