import 'package:ahdaf_task/presentation/home/tabs/homeTab/homeTab.dart';
import 'package:ahdaf_task/presentation/home/utils/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home';
  List<ConsumerStatefulWidget> tabs = [
    const HomeTab(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildCustomBottomNavigationBar(
        context: context,
        selectedIndex: 0,
        onTapFunction: (index) {},
      ),
      body: tabs[0],
    );
  }
}
