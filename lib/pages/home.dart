import 'package:app/colors/colors.dart';
import 'package:app/components/drawer_component.dart';
import 'package:app/functions/record_functions.dart';
import 'package:app/widgets/audio_button_widget.dart';
import 'package:app/widgets/record_button_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarText = "Yalnız Değilsin!";
  bool isRecording = false;

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
      drawer: const DrawerComponent(),
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
            const SizedBox(
              height: 30,
            ),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  if (isRecording) {
                    stopRecording();
                    setState(() {
                      isRecording = false;
                    });
                  } else {
                    startRecording();
                    setState(() {
                      isRecording = true;
                    });
                  }
                },
                backgroundColor:
                    isRecording ? Colors.red : AppColors.primaryColor,
                child: Icon(
                  isRecording ? Icons.stop : Icons.mic,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
