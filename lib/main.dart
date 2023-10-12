import 'package:flutter/material.dart';
import 'package:flutter_tips/key/key_page.dart';
import 'package:flutter_tips/key/switcher_widget.dart';
import 'package:flutter_tips/provider/change_notifier_demo.dart';
import 'package:flutter_tips/provider/future_demo.dart';
import 'package:flutter_tips/provider/multi_demo.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:flutter_tips/provider/provider_demo.dart';
import 'package:flutter_tips/provider/proxy_provider_demo.dart';
import 'package:flutter_tips/provider/shop/change_notifier_proxy_demo.dart';
import 'package:flutter_tips/provider/shop/entity/collection_list_model.dart';
import 'package:flutter_tips/provider/shop/entity/list_entity.dart';
import 'package:flutter_tips/sliver/custom_tabview.dart';
import 'package:flutter_tips/sliver/foo.dart';
import 'package:flutter_tips/sliver/sliver/sliver_full.dart';
import 'package:flutter_tips/sliver/sliver/sliver_grid.dart';
import 'package:flutter_tips/sliver/sliver/sliver_list.dart';
import 'package:flutter_tips/sliver/sliver/sliver_stack.dart';
import 'package:flutter_tips/sliver/sliver_page.dart';
import 'dart:developer';

import 'package:flutter_tips/sliver/tab_page.dart';
import 'package:provider/provider.dart';

import 'animation/animation_all.dart';

void main() {
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SliverFullPage(),
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
            const Text("you have pushed many times"),
            Text("$_counter"),
            FooWidget(
                count: _counter,
                onPress: () {
                  setState(() {
                    _counter += 2;
                  });
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
