import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            title: const Icon(Icons.settings),
            onTap: () {},
          ),
          EmptyBox(),
          ListTile(
            title: Icon(Icons.person),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  SizedBox EmptyBox() => SizedBox(height: 30);
}
