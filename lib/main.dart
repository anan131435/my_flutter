import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tips/animation/signature/signature_painter.dart';
import 'package:flutter_tips/animation/signature/signature_widge.dart';
import 'package:flutter_tips/async_learn/multi_thread.dart';
import 'package:flutter_tips/basic/tab_page.dart';
import 'package:flutter_tips/basic/tapbox.dart';
import 'package:flutter_tips/calendar/dart_calendar/calendar_view.dart';
import 'package:flutter_tips/chat/chat_page.dart';
import 'package:flutter_tips/constrains/layout.dart';
import 'package:flutter_tips/key/key_page.dart';
import 'package:flutter_tips/key/state_lost.dart';

import 'package:flutter_tips/key/switcher_widget.dart';
import 'package:flutter_tips/layout/layout.dart';
import 'package:flutter_tips/pointer/gesture.dart';
import 'package:flutter_tips/pointer/pointer_indicattor.dart';
import 'package:flutter_tips/provider/future_demo.dart';
import 'package:flutter_tips/provider/inherited_widget.dart';
import 'package:flutter_tips/provider/multi_demo.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:flutter_tips/provider/provider_dependence_proxy.dart';
import 'package:flutter_tips/provider/proxy_provider_demo.dart';
import 'package:flutter_tips/provider/shop/change_notifier_proxy_demo.dart';
import 'package:flutter_tips/provider/shop/entity/collection_list_model.dart';
import 'package:flutter_tips/provider/shop/entity/list_entity.dart';
import 'package:flutter_tips/route/new_route.dart';
import 'package:flutter_tips/route/tip_route.dart';
import 'package:flutter_tips/sliver/foo.dart';
import 'package:flutter_tips/alert/alert_page.dart';
import 'package:flutter_tips/sliver/grid_page.dart';
import 'package:flutter_tips/sliver/keep_alive_test_page.dart';
import 'package:flutter_tips/sliver/list_view/list_view_page.dart';
import 'package:flutter_tips/sliver/sliver/home_sliver_page.dart';
import 'package:flutter_tips/state_manage/logo_model.dart';
import 'package:flutter_tips/state_manage/model/logo_model_provider.dart';
import 'package:flutter_tips/state_manage/my_inherited.dart';
import 'package:flutter_tips/state_manage/my_provider.dart';
import 'package:flutter_tips/state_manage/state_one.dart';
import 'package:flutter_tips/state_manage/my_inherited.dart';
import 'package:flutter_tips/state_manage/ui/my_provider.dart';
import 'package:flutter_tips/text/text_page.dart';
import 'package:flutter_tips/video/bumble_bee_page.dart';
import 'package:flutter_tips/video/video_app.dart';
import 'package:flutter_tips/video/video_player_screen.dart';


import 'package:provider/provider.dart';

import 'animation/animation_all.dart';
import 'animation/scale_animation.dart';
import 'basic/column_page.dart';
import 'basic/stack_column_page.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _multiProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Person1>(
          create: (context) => Person1(),
        ),
        ChangeNotifierProvider<Person2>(
          create: (context) => Person2(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MultiProviderDemo(),
      ),
    );
  }

  Widget _futureProvider() {
    return FutureProvider<PersonFuture>(
      initialData: PersonFuture("initName"),
      create: (context) =>
          Future.delayed(const Duration(milliseconds: 2000), () => PersonFuture("updateLaterFutureProvider")),
      child: const MaterialApp(
        home: FutureProviderDemo(),
      ),
    );
  }

  Widget _streamProvider() {
    return StreamProvider<PersonFuture>(
      initialData: PersonFuture("initName"),
      create: (context) => Stream<PersonFuture>.periodic(
          const Duration(seconds: 1), (computationCount) => PersonFuture("StreamProvider--$computationCount")),
      child: const MaterialApp(
        home: FutureProviderDemo(),
      ),
    );
  }

  //proxyProvider<T,R>,R依赖T或者用到T的值，T发生改变会通知R
  Widget _proxyProviderWidget() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Person>(
          create: (context) => Person(),
        ),
        ProxyProvider<Person, EatModel>(
          update: (context, value, previous) => EatModel(value.name),
        ),
      ],
      child: const MaterialApp(
        home: ProxyProviderWidget(),
      ),
    );
  }

  Widget _proxyChangeNotifierProvider() {
    return MultiProvider(providers: [
      Provider<ListModel>(create: (context) => ListModel()),
      ChangeNotifierProxyProvider<ListModel,CollectionListModel>(
        create: (context) => CollectionListModel(ListModel()),
        update: (context, value, previous) => CollectionListModel(value),
      ),
    ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: const ChangeNotifierProxyDemo(),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // return _multiProvider();

    return ChangeNotifierProvider<Rule>(
      create: (context) {
         Rule rule = Rule("123");
        rule.refreshData();
        return rule;
      },
      child: MaterialApp(
        title: "MaterialApp",
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        routes: {
          "new_page": (context) => const NewRoute(),
          "/": (context) => const VideoPlayerScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final GlobalKey<SwitchWidgetState> key = GlobalKey();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PointerIndicator(),));
            },
                child: const Text("手势"),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GestureRecognizerPage(),));
                }, child: const Text("富文本手势")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "new_page", arguments: {"name":"Java"});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
