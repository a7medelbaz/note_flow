import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String appBarTitle;
  final Function onpressed;
  const MyAppbar({
    super.key,
    required this.onpressed,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            onpressed;
          },
        ),
      ],
    );
  }

  // لازم نضيف PreferredSize علشان Flutter يعرف ارتفاع الـ AppBar
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}
