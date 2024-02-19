import 'package:flutter/material.dart';
class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.warning_amber_sharp,color: Colors.yellow,),
          const Text("周杰伦的青花瓷",style: TextStyle(fontSize: 24),),
          IconButton(onPressed: (){
            print("dissmiss");
          }, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
