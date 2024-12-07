import 'package:app/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:app/colors/colors.dart'; // Renk paleti

class SmsVerificationPage extends StatefulWidget {
  const SmsVerificationPage({super.key});

  @override
  _SmsVerificationPageState createState() => _SmsVerificationPageState();
}

class _SmsVerificationPageState extends State<SmsVerificationPage> {
  final TextEditingController _smsController = TextEditingController();

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
                color: AppColors.primaryColor, // Turuncu başlık
              ),
            ),
            const SizedBox(height: 20),

            // Açıklama
            Text(
              "Telefonunuza gönderilen SMS kodunu girin.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor, // Beyaz metin
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // SMS Giriş Alanı
            PinCodeField(controller: _smsController),

            const SizedBox(height: 30),

            // Onay Butonu
            ConfirmPinWidget(smsController: _smsController),
          ],
        ),
      ),
    );
  }
}

class ConfirmPinWidget extends StatelessWidget {
  const ConfirmPinWidget({
    super.key,
    required TextEditingController smsController,
  }) : _smsController = smsController;

  final TextEditingController _smsController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF39C12), // Turuncu
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Yuvarlak köşeler
        ),
      ),
      onPressed: () {
        if (_smsController.text.length == 6) {
          // Doğrulama işlemi başarılı, başka bir sayfaya geçiş yapılabilir
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('SMS doğrulaması başarılı!')),
          );
        } else {
          // Hata mesajı
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Geçersiz kod!')),
          );
        }
      },
      child: Text(
        "Doğrula", // Parametre olarak alınan buton metni
        style: TextStyle(
          fontSize: 18,
          color: Colors.black, // Buton üzerindeki yazı: Siyah
        ),
      ),
    );
  }
}
