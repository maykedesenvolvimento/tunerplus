import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tunerplus/core/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const AppText({
    Key? key,
    required this.text,
    this.size = 14,
    this.color = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kanit(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
