import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';

import '../../../provider/theme/theme_provider.dart';
import '../constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool borderSides;
  final double? radius;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
final bool obscureText;
  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.borderSides = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.radius,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      height: 40,
      child: TextFormField(
      style:  TextStyle(
          color: Colors.white,
        ),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: Colors.black,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: darkGrey, width: 2),
            borderRadius: BorderRadius.circular(radius ?? 50),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide:  BorderSide(color: isDarkMode ? Colors.white : primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 50),
            borderSide:  BorderSide(color: isDarkMode ? Colors.white : primaryColor),
          ),
          fillColor: isDarkMode ? darkGrey : Colors.orangeAccent.withOpacity(0.1),
          focusColor: Colors.blueGrey,
          hintStyle:  TextStyle(fontSize: 12.0,
              color: isDarkMode ? Colors.white:Colors.black),
        ),
      ),
    );
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 2)} ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
