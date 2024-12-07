import 'package:app/pages/login.dart';
import 'package:app/pages/wyh_phonenumber.dart';
import 'package:flutter/material.dart';

class HowToUseScreen extends StatelessWidget {
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
              // Mikrofon İkonu
              Icon(
                Icons.mic, // Mikrofon simgesi
                size: MediaQuery.of(context).size.width * 0.3, // Dinamik boyut
                color: Color(0xFFF39C12), // Turuncu renk
              ),
              // Başlık
              Text(
                "Uygulama Nasıl Kullanılır?",
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
                    "Ses kayıt tuşuna bastığınızda, ses verileriniz analiz edilir. "
                    "Eğer bir tehdit algılanırsa, rehberinizden seçtiğiniz kişilere otomatik olarak bir mesaj gönderilir.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70, // Açıklama: Hafif beyaz
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Devam Butonu
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF39C12), // Turuncu
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Yuvarlak köşeler
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WhyPhoneNumberScreen()), // Replace with your next screen
                  );
                },
                child: Text(
                  "Anladım",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black, // Turuncu düğme üzerindeki yazı: Siyah
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
