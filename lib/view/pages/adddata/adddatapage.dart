import 'package:atnear/utils/extension/space_extn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/Helper/screensize.dart';
import '../../../utils/colors.dart';
import '../../common/appbutton.dart';
import '../../common/turbo_appbar.dart';
import '../../common/turbo_text.dart';
import '../../common/turbo_textfeild.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController itemnameContrl = TextEditingController(),
      itemcodeContrl = TextEditingController();
  var uuid = const Uuid();
  bool? isbtnvalid = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: TurboAppBar(),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Lottie.asset(
                  'assets/lottie/adddata.json',
                ),
              ),
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TurboTextFeild(
                      controller: itemnameContrl,
                      hinttext: 'Item Name',
                      onchanged: (value) {
                        getbtnvalid();
                      },
                    ),
                    10.hBox,
                    TurboTextFeild(
                      controller: itemcodeContrl,
                      hinttext: 'HSN Code',
                      onchanged: (value) {
                        getbtnvalid();
                      },
                    ),
                    15.hBox,
                    TurboButton(
                      onPressed: () {
                        var id = uuid.v4();
                        if (itemcodeContrl.text == '' ||
                            itemnameContrl.text == '') {
                          showsnackbar('failed');
                        } else {
                          var searchlist =[];
                          String? currentString=''; 
                          setState(() {
                            isbtnvalid = false;
                          });
                          for (var i = 0; i < itemnameContrl.text.length; i++) {
                            currentString =  "$currentString${itemnameContrl.text[i]}";
                            searchlist.add(currentString);
                          }
                          FirebaseFirestore.instance
                              .collection('items')
                              .doc(id)
                              .set({
                            "id": id,
                            "date": DateTime.now(),
                            "itenname": itemnameContrl.text.trim(),
                            "itemcode": itemcodeContrl.text.trim(),
                            "status":1,
                            "search":searchlist
                          }).then((value) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      isValid: isbtnvalid,
                      child: const TurboText(
                        text: 'Submit',
                        color: kwhite,
                        fontSize: 16,
                        letterspace: 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  showsnackbar(var msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      //backgroundColor: ,
    ));
  }

  getbtnvalid() {
    if (itemcodeContrl.text != '' && itemnameContrl.text != '') {
      setState(() {
        isbtnvalid = true;
      });
    } else {
      setState(() {
        isbtnvalid = false;
      });
    }
  }
}
