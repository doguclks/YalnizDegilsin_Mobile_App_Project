import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final double? height;
  const Footer({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: height,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Yalnız Değilsin © 2024',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
