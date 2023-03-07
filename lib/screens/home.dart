import 'package:flutter/material.dart';

import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/main.dart';
import 'package:makassar_pet_clinic/screens/book.dart';
import 'package:makassar_pet_clinic/screens/chat.dart';
import 'package:makassar_pet_clinic/screens/customer.dart';
import 'package:makassar_pet_clinic/screens/dashboard.dart';
import 'package:makassar_pet_clinic/screens/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LoginManager loginManager = Get.put(LoginManager());
  int currentPage = 0;
  late final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    setState(() {
      if (loginManager.role.value == "3" || loginManager.role.value == "2") {
        _pages.add(const Dashboard());
        _pages.add(const Chat());
        _pages.add(const Book());
        _pages.add(const Profile());
      } else {
        _pages.add(const Dashboard());
        _pages.add(const Customer());
        _pages.add(const Profile());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }

    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: currentPage,
        barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
        arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
        itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
        itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
        circleOutline: 15.0,
        shadowAllowance: 0.0,
        circleSize: 50.0,
        blurShadowRadius: 50.0,
        circleColor: colorPrimary,
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.grey,
        tabs: getTabsData(),
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}

List<TabData> getTabsData() {
  return [
    if (loginManager.role.value == "3" || loginManager.role.value == "2") ...[
      TabData(
        icon: Icons.home,
        iconSize: 20.0,
        title: 'Dashboard',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.chat,
        iconSize: 20,
        title: 'Chat',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.book,
        iconSize: 20,
        title: 'Book',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.person,
        iconSize: 20,
        title: 'Profile',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ] else ...[
      TabData(
        icon: Icons.home,
        iconSize: 20.0,
        title: 'Dashboard',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.group,
        iconSize: 20,
        title: 'Customer',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      TabData(
        icon: Icons.person,
        iconSize: 20,
        title: 'Profile',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ]
  ];
}
