import 'package:app/colors/colors.dart';
import 'package:app/components/footer.dart';
import 'package:app/pages/sms_verification.dart';
import 'package:app/functions/otp_functions.dart';
import 'package:app/widgets/circle_button_widget.dart';
import 'package:app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final String headingTitle = "Kayıt Ol";

  // TextEditingController'lar
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Kayıt olma fonksiyonu
  Future<void> registerUser() async {
    // Kullanıcı bilgileri
    String name = _nameController.text.trim();
    String surname = _surnameController.text.trim();
    String phone = _phoneNumberController.text.trim();
    String password = _passwordController.text.trim();
    String? verificationId =
        await registerWithPhoneNumber(phone, password, name, surname);

    if (verificationId != null) {
      Navigator.of(context).push(PageAnimationTransition(
          page: SmsVerificationPage(
            verificationId: verificationId,
            name: name,
            surname: surname,
          ),
          pageAnimationType: FadeAnimationTransition()));
    } else {
      print("Yanlislik var");
    }
  }

  @override
  void dispose() {
    // Bellek sızıntılarını önlemek için controller'ları temizleyin
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size değişkenleri
    final double height = MediaQuery.of(context).size.height;
    final double footerHeight = height * 0.1;

    // Kayıt olma sayfası
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
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
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFieldWidget(
                  hintText: 'Ad',
                  keyboardType: TextInputType.text,
                  controller: _nameController),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFieldWidget(
                  hintText: 'Soyad',
                  keyboardType: TextInputType.text,
                  controller: _surnameController),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFieldWidget(
                  controller: _phoneNumberController,
                  hintText: 'Telefon Numarası',
                  keyboardType: TextInputType.phone),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFieldWidget(
                controller: _passwordController,
                hintText: 'Şifre',
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LoginFab(onPressed: registerUser),
                ],
              ),
            ),
            Footer(height: footerHeight),
          ],
        ),
      ),
    );
  }
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
