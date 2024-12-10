import 'package:app/colors/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    this.isPassword = false,
  });

  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(color: AppColors.textColor),
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
