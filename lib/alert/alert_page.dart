import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});
  Future<bool?> showDeleteConfirmDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: const Text("请您删除当前文件"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("取消")
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("确定")
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert"),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.add_call),
          onPressed: () async {
           bool? delete = await showDeleteConfirmDialog(context);
           if (delete == null) {
             print("点击取消");
           } else {
             print("点击确定");
           }
          },
        ),
      ),
    );
  }
}
