import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class LayoutPurePage extends StatelessWidget {
  const LayoutPurePage({super.key});

  Widget alignmentWidget() {
    return const Align(
      alignment: Alignment(0, 0),
      child: FlutterLogo(size: 300,),
    );
  }

  Widget constrainsWidget() {
    return  ConstrainedBox(constraints: BoxConstraints(
      minHeight: 30,
      maxHeight: double.infinity,
      minWidth: 30,
      maxWidth: double.infinity
    ).loosen(),//松约束 最小是0 紧约束 最小等于最大
      child: FlutterLogo(size: 400,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (p0, p1) {
            print(p1);
            /*
            * flutter: BoxConstraints(0.0<=w<=393.0, 0.0<=h<=759.0)
              flutter: logo BoxConstraints(w=300.0, h=300.0)
            * */
            return Container(
              color: Colors.red[300],
              // width: 300,
              // height: 300,
              child:  Align(
                alignment: Alignment.center,//SizedBox.expand 和父级的最大尺寸一样 SizedBox.shrink 和父级的最小尺寸一样
                child: LayoutBuilder(
                  builder: (p0, p1) {
                    //Container的width height注释掉后，传递的是loose constrains, 否则是tight constrains
                    print("logo $p1");
                    return const FlutterLogo(size: 100,);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
