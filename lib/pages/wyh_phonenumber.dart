import 'package:app/pages/login.dart';
import 'package:app/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class WhyPhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ekranın tamamını kaplar
        height: double.infinity, // Ekranın tamamını kaplar
        // Arka plan: Siyah
        child: SafeArea(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Eşit boşluk dağılımı
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Telefon İkonu
              Icon(
                Icons.phone, // Telefon simgesi
                size: MediaQuery.of(context).size.width * 0.3, // Dinamik boyut
                color: Color(0xFFF39C12), // Turuncu renk
              ),
              // Başlık
              Text(
                "Telefon Numarasıyla Giriş",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Başlık: Beyaz
                ),
                textAlign: TextAlign.center,
              ),
              // Açıklama
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Text(
                    "Telefon numaranız ile giriş yaparak, güvenliğinizi artırıyoruz. "
                    "Bu sayede yalnızca sizin erişebileceğiniz bir profille, güvenli bir ortamda işlem yapabilirsiniz.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70, // Açıklama: Hafif beyaz
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Devam Butonu
              ElevatedButtonWidget(buttonText: "Devam", nextPage: Login())
            ],
          ),
        ),
      ),
    );
  }
}
