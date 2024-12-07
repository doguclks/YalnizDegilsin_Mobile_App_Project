import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonText; // Buton üzerindeki yazı
  final Widget nextPage; // Geçiş yapılacak sayfa

  const ElevatedButtonWidget({
    super.key,
    required this.buttonText, // Button metni dışarıdan alınacak
    required this.nextPage, // Sayfa dışarıdan alınacak
  });

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
        Navigator.of(context).push(PageAnimationTransition(
          page: nextPage, // Parametre olarak alınan sayfaya geçiş yapılır
          pageAnimationType: FadeAnimationTransition(), // Animasyon türü
        ));
      },
      child: Text(
        buttonText, // Parametre olarak alınan buton metni
        style: TextStyle(
          fontSize: 18,
          color: Colors.black, // Buton üzerindeki yazı: Siyah
        ),
      ),
    );
  }
}
