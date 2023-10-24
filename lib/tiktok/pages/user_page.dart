import 'package:flutter/material.dart';
class UserPage extends StatefulWidget {
  const UserPage({super.key,this.canPop = false,this.onPop, required this.isSelfPage, this.onSwitch});
final bool canPop;
final bool isSelfPage;
final Function? onPop;
final Function? onSwitch;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
