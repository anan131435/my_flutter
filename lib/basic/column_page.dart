import 'package:flutter/material.dart';
class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 180,
            color: Colors.grey,
            alignment: Alignment.center,
            child: const Text("哈哈哈哈哈",style: TextStyle(color: Colors.red)),
          ),
          Builder(
            builder: (context) {
              return Expanded(
                flex: 1,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      height: 90,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          print("$index");
                        },
                        child: Text("哥哥 $index"),
                      ),
                    );
                  },
                    itemCount: 100,
                  )
              );
            }
          ),
        ],
      ),
    );
  }
}
