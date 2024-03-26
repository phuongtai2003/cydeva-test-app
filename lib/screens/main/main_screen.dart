import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/main_controller.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/screens/main/home_screen.dart';
import 'package:test_app/widgets/bottom_nav_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainController _mainController = Get.put(MainController());
  final List<Widget> _screens = const [
    HomeScreen(),
    Scaffold(
      body: Center(
        child: Text('Chat Screen'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('History Screen'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Account Screen'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _screens[_mainController.currentNavIndex.value],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: GlobalColors.iconColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/app_icon_white.svg',
            width: 50,
            height: 50,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext cntext) {
    return Obx(
      () => BottomAppBar(
        color: Colors.white,
        elevation: 0,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavItem(
                icon: SvgPicture.asset(
                  'assets/images/home.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'Home',
                onTap: () {
                  _mainController.changeNavIndex(0);
                },
                isSelected: _mainController.currentNavIndex.value == 0,
              ),
              BottomNavItem(
                icon: SvgPicture.asset(
                  'assets/images/chat.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'Chat',
                onTap: () {
                  _mainController.changeNavIndex(1);
                },
                isSelected: _mainController.currentNavIndex.value == 1,
              ),
              const SizedBox(
                width: 24,
              ),
              BottomNavItem(
                icon: SvgPicture.asset(
                  'assets/images/history.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'History',
                onTap: () {
                  _mainController.changeNavIndex(2);
                },
                isSelected: _mainController.currentNavIndex.value == 2,
              ),
              BottomNavItem(
                icon: SvgPicture.asset(
                  'assets/images/user.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'Account',
                onTap: () {
                  _mainController.changeNavIndex(3);
                },
                isSelected: _mainController.currentNavIndex.value == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
