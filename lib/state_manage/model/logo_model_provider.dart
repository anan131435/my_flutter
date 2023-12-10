import 'package:flutter/cupertino.dart';

import '../logo_model.dart';

class LogoModelProvider extends InheritedWidget {
  final LogoModel model;
  const LogoModelProvider({super.key, required super.child, required this.model});
  static LogoModelProvider of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LogoModelProvider>()!;
  }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}