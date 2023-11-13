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
      body: LayoutBuilder(
        builder: (p0, p1) {
          print("body $p1");
          return Row(
            children: [
              const Icon(Icons.add_call,size: 100,),
              Expanded( // remove this will cause error
                child: LayoutBuilder(
                  builder: (p0, p1) {
                    print(p1);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title',style: Theme.of(context).textTheme.headlineMedium,),
                        const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
                            ' do eiusmod tempor incididunt ut labore et dolore magna '
                            'aliqua. Ut enim ad minim veniam, quis nostrud '
                            'exercitation ullamco laboris nisi ut aliquip ex ea '
                            'commodo consequat.')
                      ],
                    );
                  },
                ),
              )
            ],
          );
        }
      ),
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


