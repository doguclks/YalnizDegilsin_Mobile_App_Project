import 'package:app/colors/colors.dart';
import 'package:flutter/material.dart';

class PinCodeField extends StatelessWidget {
  final TextEditingController controller;
  const PinCodeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.textColor),
      controller: controller,
      maxLength: 6, // 6 haneli doğrulama kodu
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Doğrulama Kodu',
        labelStyle:
            TextStyle(color: AppColors.secondaryTextColor), // Hafif beyaz
        hintText: 'SMS kodunu girin',
        hintStyle:
            TextStyle(color: AppColors.secondaryTextColor), // Hafif beyaz
        counterText: "", // Karakter sayısını gizler
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryColor), // Turuncu kenarlık
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryColor), // Turuncu kenarlık
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: false, // Şifre değil, normal metin girişi
    );
  }
}
