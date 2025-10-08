import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;
  final Widget appbarIcon;
  const MyAppbar({
    super.key,
    required this.appBarTitle, required this.appbarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // centerTitle: false,
      actions: [
        appbarIcon
      ],
    );
  }

  // لازم نضيف PreferredSize علشان Flutter يعرف ارتفاع الـ AppBar
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}
