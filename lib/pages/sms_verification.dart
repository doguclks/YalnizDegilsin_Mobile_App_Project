import 'package:app/services/register_w_phoneNumber.dart'; // Doğrulama işlemleri için servis
import 'package:app/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:app/colors/colors.dart'; // Renk paleti

class SmsVerificationPage extends StatefulWidget {
  final String verificationId;
  SmsVerificationPage({super.key, required this.verificationId});

  @override
  State<SmsVerificationPage> createState() => _SmsVerificationPageState();
}

class _SmsVerificationPageState extends State<SmsVerificationPage> {
  final TextEditingController _smsController = TextEditingController();

  Future<void> handleVerification() async {
    String smsCode = _smsController.text.trim();

    try {
      // Services klasöründeki verifySMSCode fonksiyonu çağrılıyor
      await verifySMSCode(widget.verificationId, smsCode);

      // Doğrulama başarılı olduğunda ana menüye yönlendirme
      Navigator.of(context).pushReplacementNamed('/mainMenu');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('SMS doğrulaması başarılı!')),
      );
    } catch (e) {
      // Hata mesajı
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Doğrulama başarısız: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Başlık
            Text(
              "SMS ile Doğrulama",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 20),

            // Açıklama
            Text(
              "Telefonunuza gönderilen SMS kodunu girin.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // SMS Giriş Alanı
            PinCodeField(controller: _smsController),

            const SizedBox(height: 30),

            // Onay Butonu
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF39C12), // Turuncu
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (_smsController.text.length == 6) {
                  handleVerification();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Geçersiz kod!')),
                  );
                }
              },
              child: Text(
                "Doğrula",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
