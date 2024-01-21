import 'package:flutter/material.dart';

class CommonStyle {
  // TEXTFORM FIELD PROPERTIES
  static InputDecoration textField(
      {String? labelText = '', String? hintText = ''}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      // label: Text(hintText!),
      filled: true,
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            style: BorderStyle.none,
            strokeAlign: BorderSide.strokeAlignOutside),
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.none,
              strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  // BUTTON PROPERTIES
  static ButtonStyle buttonStyle(
      {Color? btnColor,
      double width = 250,
      Color? textColor,
      double? textSize = 19}) {
    return ButtonStyle(
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: textSize, fontWeight: FontWeight.w500)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        minimumSize: MaterialStateProperty.all(Size(width, 60)),
        backgroundColor: MaterialStateProperty.all(btnColor),
        foregroundColor: MaterialStateProperty.all(textColor));
  }
}