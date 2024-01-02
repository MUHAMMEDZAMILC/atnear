

// ignore_for_file: must_be_immutable

import 'package:atnear/utils/extension/space_extn.dart';
import 'package:atnear/utils/extension/string_extn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/Helper/helper_loader.dart';
import '../../../utils/Helper/screensize.dart';
import '../../../utils/colors.dart';
import '../../common/turbo_text.dart';

class DeleteHistoryScreen extends StatefulWidget {
  DeleteHistoryScreen({super.key,required this.stream});
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  @override
  State<DeleteHistoryScreen> createState() => _DeleteHistoryScreenState();
}

class _DeleteHistoryScreenState extends State<DeleteHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder(
              stream:widget.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                   return SizedBox(
                      height: ScreenUtil.screenHeight!*0.7,
                      child: const Center(
                        child: MyAppLoader(),
                      ),
                    );
                } else if(snapshot.data!.docs.isEmpty) {
                    return  SizedBox(
                        // width: ScreenUtil.screenWidth,
                      height: ScreenUtil.screenHeight!*0.7,
                      child: Lottie.asset(
                        'assets/lottie/nodata.json',
                        width: 250,
                        height: 250
                      ),
                    );
                }else{
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: kwhite,
                        visualDensity: VisualDensity.compact,
                        title: TurboText(
                          text: snapshot.data!.docs[index]['itenname']
                              .toString()
                              .upperCase,
                          color: kblack.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterspace: 0.6,
                          fontFamily: '',
                        ),
                        subtitle: TurboText(
                          text: snapshot.data!.docs[index]['itemcode']
                              .toString()
                              .upperCase,
                          color: kblack.withOpacity(0.7),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterspace: 0.6,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('items')
                                  .doc(snapshot.data!.docs[index]['id'])
                                  .update({"status": 3});
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: kamber,
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0.8,
                        color: kblack.withOpacity(0.1),
                      );
                    },
                  );}
              
              }),
          50.hBox
        ],
      ),
    );
  }
}