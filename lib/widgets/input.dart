import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String inputText;
  final String inputHelpText;
  const InputWidget(
      {Key? key, required this.inputHelpText, required this.inputText})
      : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: widget.inputText, color: AppColors.grey1),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            style: TextStyle(fontFamily: 'Poppins', color: Colors.black54),
            controller: null,
            decoration: InputDecoration(
                focusColor: AppColors.white,
                hintFadeDuration: Duration(seconds: 1),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.green,
                        width: 1,
                        style: BorderStyle.solid)),
                // label:
                //     TextWidget(text: 'Username', color: AppColors.grey2),
                hintText: widget.inputHelpText,
                labelStyle:
                    TextStyle(fontFamily: 'Poppins', color: Colors.black26),
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    borderSide: BorderSide(
                        color: AppColors.grey3,
                        width: 1,
                        style: BorderStyle.solid))),
          )
        ],
      ),
    );
  }
}
