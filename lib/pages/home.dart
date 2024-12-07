import 'package:app/colors/colors.dart';
import 'package:app/components/drawer_component.dart';
import 'package:app/widgets/audio_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  String appBarText = "Yalnız Değilsin!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          appBarText,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.textColor),
        )),
      ),
      drawer: DrawerComponent(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage('assets/images/woman_stop.jpg'),
            fit: BoxFit.cover, // Tam ekran doldurur
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: AudioButton(),
            )
          ],
        ),
      ),
    );
  }
}
