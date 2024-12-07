import 'package:app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AudioButton extends StatefulWidget {
  const AudioButton({super.key});

  @override
  _AudioButtonState createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton>
    with SingleTickerProviderStateMixin {
  bool isRecording = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Animasyonu sürekli tekrarla
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRecording = !isRecording;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2, // Buton genişliği
        height: 60, // Buton yüksekliği
        decoration: BoxDecoration(
          color: isRecording ? AppColors.buttonColor : AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isRecording
            ? AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: WavePainter(_controller.value),
                    child: const SizedBox.expand(),
                  );
                },
              )
            : const Icon(
                Icons.mic,
                color: Colors.white,
                size: 32,
              ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double progress;

  WavePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final waveHeight = size.height / 4;
    final waveLength = size.width / 10;
    final path = Path();

    for (double x = 0; x <= size.width; x++) {
      final y = size.height / 2 +
          waveHeight * sin((x / waveLength + progress * 2 * pi) % (2 * pi));
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
