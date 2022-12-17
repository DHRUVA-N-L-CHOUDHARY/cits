import 'package:cits_assignment/utils/constants/Colors.dart';
import 'package:flutter/material.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.margins,
    this.press,
    this.customwidth = double.infinity,
    this.customheight = 50
  }) : super(key: key);
  final String? text;
  final double? margins;
  final Function? press;
  final double? customwidth;
  final double? customheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margins??0),
      padding: EdgeInsets.all(margins??0),
      child: SizedBox(
      width: customwidth,
      height: customheight,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    )
    );
  }
}
