import 'package:app/colors/colors.dart';
import 'package:flutter/material.dart';

class LoginFab extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.buttonColor, // Butonun arka plan rengi
      child: const Icon(
        Icons.arrow_right_alt, // İçerisine Login ikonu veya ok ikonu
        size: 28,
        color: Colors.white,
      ),
    );
  }
}
