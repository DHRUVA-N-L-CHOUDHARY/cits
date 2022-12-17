import 'package:cits_assignment/utils/constants/Colors.dart';
import 'package:cits_assignment/utils/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputTextwidget extends StatelessWidget {
   InputTextwidget(
      {super.key,
      this.labelText,
      this.controller,
      required this.hintText,
      this.textInput = TextInputType.text,
      this.textAlign = TextAlign.left,
      this.isSecure = false,
      this.isDisabled = false,
      this.isDigitsOnly = false,
      this.maxLength,
      this.suffixWidget,
      this.prefixWidget,
      this.focus,
      this.validation,
      this.emptyValidation = true,
      this.nextFocus,
      this.onChange,
      this.maxLine,
      this.option = false,
      this.keytype = TextInputType.text,
      this.icondata = Icons.abc});

  String? labelText;
  final TextEditingController? controller;
  final TextInputType textInput;
  final TextAlign textAlign;
  final String hintText;
  final TextInputType keytype;
  int? maxLength;
  bool isSecure;
  bool isDisabled = false;
  bool isDigitsOnly;
  bool emptyValidation;
  FocusNode? focus;
  Widget? suffixWidget;
  Widget? prefixWidget;
  var validation;
  var nextFocus;
  var onChange;
  int? maxLine;
  IconData icondata;
  final bool option;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding:
              EdgeInsets.all(SizeConfig(context).getProportionatePadding()),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontFamily: 'Roboto'),
            keyboardType: keytype,
            obscureText: isSecure,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: labelText,
              prefixIcon: Icon(
                icondata,
                color: kPrimaryColor,
              ),
            ),
            onEditingComplete: nextFocus,
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}
