import 'package:flutter/material.dart';
import 'package:haggle_x/utils/colors.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool shudObscure;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final Function onValidate;
  final Function onSave;
  final Color textColor;
  final Color borderColor;
  final Color labelColor;
  final String intialValue;
  final IconData prefixIconData;
  final int minLines;
  final int maxLines;
  final bool isMultilnes;
  final IconData suffixIconData;
  final Function onTap;

  CustomTextField({
    Key key,
    this.hintText,
    this.shudObscure,
    this.keyBoardType,
    this.controller,
    this.onValidate,
    this.onSave,
    this.textColor,
    this.borderColor,
    this.labelColor,
    this.intialValue,
    this.prefixIconData,
    this.minLines,
    this.maxLines,
    this.labelText,
    this.isMultilnes = false,
    this.suffixIconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        initialValue: intialValue ?? null,
        onSaved: onSave,
        keyboardType: keyBoardType,
        obscureText: shudObscure ?? false,
        controller: controller,
        validator: onValidate,
        minLines: minLines,
        maxLines: maxLines ?? 1,
        style: TextStyle(
          fontSize: 16
        ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor ?? kBlackColor,
          fontSize: 12),
          
         
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              suffixIconData,
              size: 18,
              color: kWhiteColor,
            ),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: kBlackColor
              )
          ),
          enabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(
              color:kBlackColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(

            borderSide: BorderSide(
              color:Color(0xffBA3AF9),
            ),
          ),

          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
