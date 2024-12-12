import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService {
  late stt.SpeechToText _speech;

  SpeechRecognitionService() {
    _speech = stt.SpeechToText();
  }

  Future<bool> startSpeechToText({required Function(String) onResult}) async {
    bool available = await _speech.initialize(
      onStatus: (status) => print("Durum: $status"),
      onError: (error) => print("Hata: $error"),
    );

    if (available) {
      _speech.listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
      );
    }

    return available;
  }

  void stopSpeechToText() {
    _speech.stop();
  }
}
