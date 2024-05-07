import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:provider/provider.dart';
class DependenceProviderPage extends StatefulWidget {
  const DependenceProviderPage({super.key});

  @override
  State<DependenceProviderPage> createState() => _DependenceProviderPageState();
}

class _DependenceProviderPageState extends State<DependenceProviderPage> {

  Widget getFirstChildWidget(BuildContext context) {
    print("getFirstChildWidget");
    final rule = Provider.of<Rule>(context);
    return Text(rule.id);
  }
  Widget getSecondChildWidget(BuildContext context) {
    print("getSecondChildWidget");
    final rule = Provider.of<Rule>(context);
    if (rule.listValue != null) {
      return ChangeNotifierProvider(create: (context) {
        return DiscoverChangeController(rule.id, rule.listValue!);
      },
        child: LayoutBuilder(builder: (buildContext, p1) {
          return fetchDiscoverChild(context: buildContext);
        },)
      );
    } else {
      return Text("null");
    }
  }
  Widget fetchDiscoverChild({required BuildContext context}) {
    final controller = Provider.of<DiscoverChangeController>(context);
    return Text("${controller.dataSource.first}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("APPbar"),
      ),
      body: Center(
        child: Column(
          children: [
            getFirstChildWidget(context),
            getSecondChildWidget(context),
            // Consumer<Rule>(builder: (context, value, child) {
            //   if (value.listValue != null) {
            //     return Text(value.listValue!.first);
            //   } else {
            //     return const Text("listValue is Empty");
            //   }
            // },
            // ),
          ],
        ),
      ),
    );
  }
}
