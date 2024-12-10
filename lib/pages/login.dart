import 'package:app/colors/colors.dart'; // Renk paleti importu
import 'package:app/components/footer.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/register.dart';
import 'package:app/widgets/circle_button_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final String headingTitle = "Hoşgeldiniz";
  final String subtitle = "Hesabınız yok mu ?";

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  LoginText(
                    headingTitle: headingTitle,
                    fontsize: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                controller: _phoneNumberController,
                hintText: 'Telefon Numarası',
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                controller: _passwordController,
                hintText: 'Şifre',
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.textColor, // Beyaz metin
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      ' Kayıt ol!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor, // Turuncu renk
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: Register(),
                          pageAnimationType: FadeAnimationTransition()));
                    },
                  ),
                )
              ],
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
                        page: HomePage(),
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

class LoginText extends StatelessWidget {
  const LoginText(
      {super.key, required this.headingTitle, required this.fontsize});

  final String headingTitle;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingTitle,
      style: TextStyle(
        color: AppColors.primaryColor, // Turuncu renk
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
      ),
    );
  }
}
