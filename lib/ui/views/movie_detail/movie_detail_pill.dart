import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:string_to_color/string_to_color.dart';

class MovieDetailPill extends StatelessWidget {
  final _color = Color(
    (math.Random().nextDouble() * 0x00FFFF).toInt(),
  ).withOpacity(1.0);
  final options = Options(
    luminosity: Luminosity.dark,
    // alpha: 0.7,
  );

  final String text;
  final EdgeInsets margins;

  MovieDetailPill({
    Key? key,
    required this.text,
    required this.margins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RandomColor.seed(text.hashCode);

    final color = ColorUtils.stringToColor(
      RandomColor.getColor(options),
    );

    return Container(
      margin: margins,
      child: Chip(
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
