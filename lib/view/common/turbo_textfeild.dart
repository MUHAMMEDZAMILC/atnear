
import 'package:atnear/utils/extension/space_extn.dart';
import 'package:atnear/view/common/turbo_text.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class TurboTextFeild extends StatelessWidget {
  TurboTextFeild(
      {super.key,
      this.hinttext,
      required this.controller,
      this.height,
      this.fiiled,
      this.filledColor,
      this.keybosrdtype,
      this.maxLine,
      this.suffixIcon,
      this.obscureText,
      this.onchanged,
      this.suffixIconColor});
  String? hinttext;
  TextEditingController controller = TextEditingController();
  double?  height;
  int?  maxLine;
  TextInputType? keybosrdtype;
  bool? fiiled, obscureText;
  Color? filledColor, suffixIconColor;
  Widget? suffixIcon;
  Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ,
      child: TextFormField(
        controller: controller,
        cursorColor: kblack.withOpacity(0.8),
        cursorHeight: 17,
        maxLines:maxLine??1,
        obscureText: obscureText ?? false,
        keyboardType: TextInputType.text,
        onChanged: onchanged,
        // validator: (value) {
        //   return (value == null || value.isEmpty) ? null : null;
        // },
        decoration: InputDecoration(
            filled: fiiled ?? false,
            fillColor: filledColor ?? kwhite,
            hintText: hinttext ?? '',
            label: TurboText(text: hinttext??'',fontSize: 12,letterspace: 0.5,fontWeight: FontWeight.w500,color: ksecondarycolor.withOpacity(0.9),),
            contentPadding: maxLine!=null? const EdgeInsets.symmetric(horizontal: 20,vertical: 10):const EdgeInsets.symmetric(horizontal: 20),
            hintStyle: TextStyle(color: kblack.withOpacity(0.5), fontSize: 13,letterSpacing: 0.6,fontWeight: FontWeight.w300),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: kblack.withOpacity(0.2), width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: kblack.withOpacity(0.2), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: khintcolor.withOpacity(0.6), width: 1)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: suffixIcon ?? 0.hBox,
            suffixIconColor: suffixIconColor ?? kprimarycolor),
      ),
    );
  }
}
