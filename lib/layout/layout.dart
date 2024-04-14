import 'package:flutter/material.dart';
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Error"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.add_call,size: 30,),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Lorem ipsum dolor sit amet.Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet')
              ],
            ),
          ),
          const Icon(Icons.close),
        ],
      ),
      floatingActionButton: Builder(builder: (context) {
        return Container();
      },),
    );
  }
}

class VerticalPage extends StatelessWidget {
  const VerticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vertical viewport was given unbounded height"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Header",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 45),),
            Expanded( // remove this will cause error
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.add_call),
                    title: Text("Phone"),
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_call),
                    title: Text("Phone"),
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_call),
                    title: Text("Phone"),
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_call),
                    title: Text("Phone"),
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key, required this.title});
  final String title;

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print("build(BuildContext context) ${widget.title}");
    return Center(
      child: Text(widget.title,textScaleFactor: 5,),
    );
  }
}

class PageViewMain extends StatefulWidget {
  const PageViewMain({super.key});

  @override
  State<PageViewMain> createState() => _PageViewMainState();
}

class _PageViewMainState extends State<PageViewMain> {
  var children = <Widget>[];

  @override
  void initState() {
    for(int i = 0; i < 6; i ++) {
      children.add(PageViewDemo(title: '$i'));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: children,
      ),
    );
  }
}


