import 'package:flutter/material.dart';

class RecordingButton extends StatelessWidget {
  final bool isRecording;
  final Function startRecording;
  final Function stopRecording;
  final ValueChanged<String> onRecordingPathChanged;

  const RecordingButton({
    Key? key,
    required this.isRecording,
    required this.startRecording,
    required this.stopRecording,
    required this.onRecordingPathChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (isRecording) {
          stopRecording();
        } else {
          startRecording();
          onRecordingPathChanged(
              "mock_path/recording.mp4"); // Gerçek yolu ayarlayın
        }
      },
      backgroundColor:
          isRecording ? Colors.red : Theme.of(context).colorScheme.primary,
      child: Icon(
        isRecording ? Icons.stop : Icons.mic,
        color: Colors.white,
      ),
    );
  }
}
