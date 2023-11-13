import 'package:flutter/material.dart';
class TiktokPage extends StatefulWidget {
  const TiktokPage({super.key});

  @override
  State<TiktokPage> createState() => _TiktokPageState();
}

class _TiktokPageState extends State<TiktokPage> {
  int _currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiktok"),
        centerTitle: true,
      ),
      body: Container(
        child: PageView.builder(
          onPageChanged: (value) {
            print("currentPage is $value");
            _currentPage = value;
          },
          controller: pageController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
          return  const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FlutterLogo(),
          );
        },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut);
        },
        child: const Icon(Icons.forward),
      ),
    );
  }
}
