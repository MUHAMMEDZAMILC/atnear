import 'package:atnear/utils/Helper/screensize.dart';
import 'package:flutter/cupertino.dart';

import '../colors.dart';

class MyAppLoader extends StatelessWidget {
  const MyAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
            width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight!*0.9,
            child: Center(child: Container(width: 80,height: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: kwhite,boxShadow: [BoxShadow(color: kblack.withOpacity(0.4),blurStyle: BlurStyle.outer,blurRadius: 5)]),child: const Center(child: CupertinoActivityIndicator(color: kamber,radius: 12,),),))
          );
  }
}