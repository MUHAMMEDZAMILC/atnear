import 'package:atnear/view/common/turbo_richtext.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class TurboAppBar extends StatelessWidget implements PreferredSizeWidget {
  TurboAppBar({super.key, this.title, this.actions, this.isback = true});
  Widget? title;
  TurboRichText? richText;
  List<Widget>? actions = [];
  bool? isback;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: kwhite,
          boxShadow: [BoxShadow(color: khintcolor,blurRadius: 5,spreadRadius: 3)]
        ),
      ),
      elevation: 20,
      leading:isback==true? IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)):null,
      title: title,
      
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
