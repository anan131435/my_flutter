import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  IOWebSocketChannel? _channel;
  final List<String> _messages = [];
  @override
  void initState() {
  _connect();
    super.initState();
  }
  void _connect() {
    _channel = IOWebSocketChannel.connect("ws://127.0.0.1:8080");
    _channel?.stream.listen((event) {
      setState(() {
        _messages.add(event);
      });
    });
  }
  void _sendMsg(String text) {
    if (text.isNotEmpty) {
      _channel?.sink.add(jsonEncode({'message': text}));
      _textEditingController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Chat"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
                itemCount: _messages.length,
              )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: "enter a message"
                      ),
                    )
                ),
                IconButton(onPressed: (){
                  _sendMsg(_textEditingController.text);
                }, icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }
}
