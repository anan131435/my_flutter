import 'package:flutter/material.dart';
import 'package:flutter_tips/key/state_lost.dart';

class StackUIColumnPage extends StatelessWidget {
  const StackUIColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.red, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                      child: Text(
                    "$index",
                    style: const TextStyle(fontSize: 16),
                  )),
                );
              },
              itemCount: 20,
            ),
          ),
          Container(
            color: Colors.blue,
            height: 80,
            alignment: Alignment.center,
            child: const Text(
              "提交",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

class StackUINoColum extends StatelessWidget {
  const StackUINoColum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              if (index != 19) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 50),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }

            },
            itemCount: 20,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.pink,
              height: 80,
              alignment: Alignment.center,
              child: const Text(
                "Commit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
