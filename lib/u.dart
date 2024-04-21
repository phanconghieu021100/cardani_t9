import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
   static const Color textColor = Color(0xff000000);
  static const Color tColor = Color(0xffA5DD9B);
  static const Color tColor2 = Color(0xffC5EBAA);
  static const Color tColor3 = Color(0xffF6F193);
  static const Color tColor4 = Color(0xffF2C18D);
 
}

class AppFonts {
  static TextStyle quicksand( {double size = 14.0, Color color = Colors.black, FontWeight weight = FontWeight.w900})
  {
    return GoogleFonts.quicksand(
      fontSize: size,
      color: color,
      fontWeight: weight
      
    );
  }

  
}