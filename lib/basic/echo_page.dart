import 'dart:ui';
import 'package:flutter/material.dart';

//StatelessWidget 用于不需要维护状态的场景
//构造函数第一个参数是key,child 或 children 是最后一个， 属性尽可能是final修饰
class EchoPage extends StatelessWidget {
  const EchoPage({
    Key? key,
    required this.text,
    this.backGroundColor = Colors.grey,
  }) : super(key: key);
  final String text;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backGroundColor,
        child: Text(text),
      ),
    );
  }
}
//context 是当前widget在widget树中位置执行相关操作的一个句柄
class ContextPage extends StatelessWidget {
  const ContextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Context Test"),
        centerTitle: true,
      ),
      body: Container(
        child: Builder(
          builder: (context) {
            Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
            return (scaffold!.appBar as AppBar).title!;
          },
        ),
      ),
    );
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({super.key});
  GetStateObjectRouteState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<GetStateObjectRouteState>();
  }
  @override
  State<GetStateObjectRoute> createState() => GetStateObjectRouteState();
}

class GetStateObjectRouteState extends State<GetStateObjectRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: (){
                    ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
                    // ScaffoldState? _state = Scaffold.of(context);
                    // _state?.openDrawer();
                    // ScaffoldMessengerState? _state = ScaffoldMessenger.maybeOf(context);
                    // SnackBar bar = const SnackBar(content: Text("bar"));
                    // _state?.showSnackBar(bar);
                  },
                child: const Text("打开抽屉菜单"),
              );
            },)
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

class CustomWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomWidget();
  }
  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {
    // TODO: implement updateRenderObject
    super.updateRenderObject(context, renderObject);
  }

}

class RenderCustomWidget extends RenderBox {
  @override
  void performLayout() {
    // TODO: implement performLayout
    super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    super.paint(context, offset);
  }
}

