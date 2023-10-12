import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/shop/pages/collection_page.dart';
import 'package:flutter_tips/provider/shop/pages/shop_list_page.dart';

class ChangeNotifierProxyDemo extends StatefulWidget {
  const ChangeNotifierProxyDemo({super.key});

  @override
  State<ChangeNotifierProxyDemo> createState() => _ChangeNotifierProxyDemoState();
}

class _ChangeNotifierProxyDemoState extends State<ChangeNotifierProxyDemo> {
  int _selectedIndex = 0;
  final _pages = const [ShopListPage(), CollectionPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "商品列表"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
            label: "收藏列表"
          )
        ],
      ),
    );
  }
}
