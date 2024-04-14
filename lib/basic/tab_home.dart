import 'package:flutter/material.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({super.key});

  @override
  State<TabHomePage> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Expanded(
    //     child: ListView.builder(
    //       itemBuilder: (context, index) {
    //         return Container(
    //           height: 60,
    //           alignment: Alignment.center,
    //           margin: const EdgeInsets.all(8.0),
    //           padding: const EdgeInsets.all(8.0),
    //           child:  Text(
    //             "$index",
    //             style: const  TextStyle(
    //               fontWeight: FontWeight.w500,
    //               color: Colors.red,
    //             ),
    //           ),
    //         );
    //       },
    //       itemCount: 100,
    //     ),
    //   ),
    // );
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.greenAccent,
      child: TextField(),
    );
  }
}
