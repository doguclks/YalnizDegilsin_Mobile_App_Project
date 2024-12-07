import 'package:app/colors/colors.dart';
import 'package:app/components/footer.dart';
import 'package:app/pages/sms_verification.dart';
import 'package:app/widgets/circle_button_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  final String headingTitle = "Kayıt Ol";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double footerHeight = height * 0.1;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RegisterText(
                    headingTitle: headingTitle,
                    fontsize: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                hintText: 'Şifre',
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                  hintText: 'Telefon Numarası',
                  keyboardType: TextInputType.phone),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LoginFab(onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const SmsVerificationPage(),
                        pageAnimationType: FadeAnimationTransition()));
                  }),
                ],
              ),
            ),
            Footer(
              height: footerHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText(
      {super.key, required this.headingTitle, required this.fontsize});

  final String headingTitle;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingTitle,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
      ),
    );
  }
}
