import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const CustomTabBar({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: <Widget>[
        _buildTab('Home'),
        _buildTab('Popular'),
        _buildTab('Promotion'),
        _buildTab('About'),
      ],
      dividerHeight: 0,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 3, color: Colors.blue),
        insets: EdgeInsets.symmetric(horizontal: -15.0),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
