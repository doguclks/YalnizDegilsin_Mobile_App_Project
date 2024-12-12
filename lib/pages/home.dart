import 'package:app/colors/colors.dart';
import 'package:app/components/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarText = "Yalnız Değilsin!";
  bool isRecording = false;
  String recognizedText = ""; // Konuşmadan algılanan metin

  late stt.SpeechToText speech;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  void startRecording() async {
    bool available = await speech.initialize(
      onStatus: (status) => print("Durum: $status"),
      onError: (error) => print("Hata: $error"),
    );

    if (available) {
      setState(() {
        isRecording = true;
        recognizedText = ""; // Önceki metni sıfırla
      });
      speech.listen(
        onResult: (result) {
          setState(() {
            recognizedText = result.recognizedWords;
          });
        },
      );
    } else {
      setState(() {
        isRecording = false;
      });
      print("Speech recognition is not available.");
    }
  }

  void stopRecording() {
    speech.stop();
    setState(() {
      isRecording = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            appBarText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ),
      ),
      drawer: const DrawerComponent(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage('assets/images/woman_stop.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            Text(
              recognizedText.isEmpty
                  ? "Konuşmaya başlamak için mikrofon simgesine dokunun."
                  : recognizedText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                backgroundColor: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  if (isRecording) {
                    stopRecording();
                  } else {
                    startRecording();
                  }
                },
                backgroundColor:
                    isRecording ? Colors.red : AppColors.primaryColor,
                child: Icon(
                  isRecording ? Icons.stop : Icons.mic,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
