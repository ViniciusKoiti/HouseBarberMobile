import 'package:flutter/material.dart';

class AppBarInitial extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onTap;

  AppBarInitial({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
