import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:provider/provider.dart';

class FutureProviderDemo extends StatelessWidget {
  const FutureProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<PersonFuture>(
          builder: (context, value, child) => Text(value.name),
        ),
      ),
    );
  }
}


class StreamProviderDemo extends StatelessWidget {
  const StreamProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<PersonFuture>(
          builder: (context, value, child) => Text(value.name),
        ),
      ),
    );
  }
}
