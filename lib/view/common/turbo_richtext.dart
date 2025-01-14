import 'package:flutter/material.dart';

class TurboRichText extends StatelessWidget {
  final String normalText;
  final String richText;
  final String? fontFamily,richfontFamily;
  final Color normalTextColor, richTextColor;
  final FontWeight richFontWeight, normalFontWeight;
  final double? fontSize, richTextFontSize;
  final double? letterspace, richletterspace;

  const TurboRichText(
      {Key? key,
      required this.normalText,
      required this.richText,
      this.fontFamily,this.richfontFamily,
      this.normalTextColor = Colors.black,
      this.richTextColor = Colors.black,
      this.normalFontWeight = FontWeight.w300,
      this.richFontWeight = FontWeight.normal,
      this.fontSize,
      this.richTextFontSize,
      this.letterspace,
      this.richletterspace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: normalText,
              style: TextStyle(
                  color: normalTextColor,
                  fontSize: fontSize ?? 12,
                  fontWeight: normalFontWeight,
                  fontFamily: fontFamily,
                  letterSpacing: letterspace)),
          TextSpan(
            text: richText,
            style: TextStyle(
                color: richTextColor,
                fontSize: richTextFontSize ?? (fontSize ?? 12),
                fontWeight: richFontWeight,
                fontFamily: richfontFamily,
                letterSpacing: richletterspace),
          ),
        ],
      ),
    );
  }
}
