import 'package:app/colors/colors.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            title: const Icon(
              Icons.settings,
              color: AppColors.buttonColor,
            ),
            onTap: () {},
          ),
          emptyBox(),
          ListTile(
            title: Icon(Icons.person, color: AppColors.buttonColor),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  SizedBox emptyBox() => SizedBox(height: 30);
}
