// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontService {
  TextStyle s40w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  TextStyle s16w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  TextStyle s80w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 80,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }

  TextStyle s20w700White(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: theme.onSecondary,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
