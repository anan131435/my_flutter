import 'package:flutter/material.dart';

typedef ViewModelWidgetBuilder<VM> = Widget Function(
    BuildContext context, VM viewModel, Widget? child);
typedef ChildViewModelWidgetBuilder<PVM, VM> = Widget Function(
    BuildContext context, PVM parent, VM viewModel, Widget? child);

class ViewModelProvider<VM extends ChangeNotifier> extends StatelessWidget {
  final VM Function(BuildContext context) create;
  final Function(BuildContext context, VM viewModel)? initViewModel;
  final ViewModelWidgetBuilder<VM>? builder;
  const ViewModelProvider({
    super.key,
    required this.create,
    this.initViewModel,
    Widget? child,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
