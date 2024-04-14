import 'package:flutter/material.dart';
class TabRankPage extends StatefulWidget {
  const TabRankPage({super.key});

  @override
  State<TabRankPage> createState() => _TabRankPageState();
}

class _TabRankPageState extends State<TabRankPage> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.red,
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
              "Home_Rank_$index",
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
