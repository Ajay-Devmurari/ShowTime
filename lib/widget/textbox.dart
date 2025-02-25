import 'package:flutter/material.dart';
import '../utils/colorlist.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({super.key, required this.text, required this.icon});

  final String text;
  final Widget icon;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorList.whiteColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorList.whiteColor, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.text,
        hintStyle: const TextStyle(color: ColorList.whiteColor),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: widget.icon,
        ),
      ),
      style: const TextStyle(color: ColorList.whiteColor),
    );
  }
}
