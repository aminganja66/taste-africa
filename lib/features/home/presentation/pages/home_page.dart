import 'package:flutter/material.dart';
import '../../../../../app/widgets/app_bottom_nav_bar.dart';
import '../../../delivery/presentation/pages/delivery_page.dart';
import '../../../dining/presentation/pages/dining_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _pages = const [
    DeliveryPage(),
    DiningPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
