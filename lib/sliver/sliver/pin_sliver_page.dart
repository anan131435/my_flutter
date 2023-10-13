import 'dart:developer';

import 'package:flutter/material.dart';
class PinnedSliverPage extends StatelessWidget {
  const PinnedSliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _headerWidget() {
      return Container(
        height: 50,
        width: 300,
        alignment: Alignment.center,
        color: Colors.grey,
        child: Text("点击搜索"),
        // child: const TextField(
        //   decoration: InputDecoration(
        //     contentPadding: EdgeInsets.all(8),
        //     fillColor: Colors.black54,
        //     filled: true,
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(25)),
        //       borderSide: BorderSide(
        //         color: Colors.white,
        //         width: 1
        //       )
        //     )
        //   ),
        // ),
      );
    }
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
              _headerWidget(),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
                child: ListView(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            log("ListView $index");
                          },
                          child: Container(
                            color: Colors.orange,
                            alignment: Alignment.center,
                            height: 90,
                            child: Text("ListView $index"),
                          ),
                        ),
                      ),
                      itemCount: 20,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1
                        ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.center,
                          child: Text("GridView $index"),
                        ),
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
