import 'package:atnear/utils/extension/space_extn.dart';
import 'package:atnear/view/common/turbo_text.dart';
import 'package:flutter/material.dart';
import '../../utils/Helper/screensize.dart';
import '../../utils/colors.dart';

// ignore: must_be_immutable
class TurboButton extends StatelessWidget {
  TurboButton({super.key, this.btnstyle, this.child, required this.onPressed,required this.isValid});
  Widget? child;
  Function()? onPressed;
  ButtonStyle? btnstyle;
  bool? isValid = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: 45,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ElevatedButton(
              style: btnstyle ??
                  const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kblack)),
              onPressed: onPressed,
              child: child),
             isValid==true?0.hBox: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(kwhite.withOpacity(0.4),),shadowColor: const MaterialStatePropertyAll(ktransparent)),
                onPressed: (){}, child:const TurboText(text: '') ),
        ],
      ),
    );
  }
}