import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextController{
  
  myStyle({
  double? size,
  Color? color,
  FontWeight fw = FontWeight.w700,
  FontStyle fs = FontStyle.normal,
}) {
  return GoogleFonts.aBeeZee(
    fontSize: size,
    color: color,
    fontStyle: fs,
    fontWeight: fw,
  );
}


}