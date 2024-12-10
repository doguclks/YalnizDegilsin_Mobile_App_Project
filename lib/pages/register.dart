import 'package:app/colors/colors.dart';
import 'package:app/components/footer.dart';
import 'package:app/pages/sms_verification.dart';
import 'package:app/services/register_w_phoneNumber.dart';
import 'package:app/widgets/circle_button_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final String headingTitle = "Kayıt Ol";

  @override
  Widget build(BuildContext context) {
    // TextEditing Degiskenleri

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _surnameController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    // Firebase degiskenleri

    String? vericiationId;

    // Size degiskenleri

    final double height = MediaQuery.of(context).size.height;
    final double footerHeight = height * 0.1;

    // Kayıt olma fonksiyonu
    Future<void> registerUser() async {
      String phone = _phoneNumberController.text.trim();
      String password = _passwordController.text.trim();
      String? verificationId = await registerWithPhoneNumber(phone, password);
    }

    // Kayıt olma sayfası
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
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                  hintText: 'Ad',
                  keyboardType: TextInputType.text,
                  controller: _nameController),
            ),
            EmptyBox(),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                  hintText: 'Soyad',
                  keyboardType: TextInputType.text,
                  controller: _surnameController),
            ),
            EmptyBox(),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                  controller: _phoneNumberController,
                  hintText: 'Telefon Numarası',
                  keyboardType: TextInputType.phone),
            ),
            EmptyBox(),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFieldWidget(
                controller: _passwordController,
                hintText: 'Şifre',
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
            ),
            EmptyBox(),
            EmptyBox(),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LoginFab(onPressed: () {
                    registerUser();
                    Navigator.of(context).push(PageAnimationTransition(
                        page: SmsVerificationPage(
                          verificationId: vericiationId!,
                        ),
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

  SizedBox EmptyBox() => SizedBox(
        height: 20,
      );
}

// Kayıt olma text widget'ı
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
