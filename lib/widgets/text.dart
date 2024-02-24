import 'package:coinnext/core/app_colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  double? size = 16;
  TextWidget({Key? key, required this.text, required this.color, this.size})
      : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontSize: widget.size,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600),
    );
  }
}
