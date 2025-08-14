import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vocabulift/constants.dart';
import 'package:vocabulift/widgets/text.dart';

class Button extends StatefulWidget {
  final GestureTapCallback onTap;
  final String text;
  const Button({super.key, required this.onTap, required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color _buttonColor = colors["containerColor"]!;
  double _sizeMultiplier = 1.0;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _buttonColor = colors["widgetColor"]!;
          });
        },
        onExit: (event) {
          setState(() {
            _buttonColor = colors["containerColor"]!;
          });
        },
        child: GestureDetector(
          onTap: () {
            setState(() {
              _sizeMultiplier = 0.9;
            });
            Future.delayed(const Duration(milliseconds: 100), () {
              setState(() {
                _sizeMultiplier = 1.0;
              });
            });
            _audioPlayer.play(AssetSource("sounds/press.wav"));
            widget.onTap();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 200 * _sizeMultiplier,
            height: 50 * _sizeMultiplier,
            decoration: BoxDecoration(
              color: _buttonColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: CustomText(text: widget.text)),
          ),
        ),
      ),
    );
  }
}
