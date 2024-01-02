import 'package:atnear/view/pages/adddata/adddatapage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/Helper/screensize.dart';
import '../../../utils/colors.dart';
import '../../common/turbo_appbar.dart';
import '../../common/turbo_text.dart';
import '../history/deletehistorypage.dart';
import '../home/homepage.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int? selectedindex = 0;
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream;

  bool searching = false;
  TextEditingController searchCtrl = TextEditingController();
  @override
  void initState() {
    stream = FirebaseFirestore.instance
        .collection('items')
        .where("status", isEqualTo: selectedindex == 0 ? 1 : 2)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      HomeScreen(
        stream: stream,
      ),
      DeleteHistoryScreen(
        stream: stream,
      )
    ];
    ScreenUtil.init(context);
    return Scaffold(
      appBar: TurboAppBar(
        isback: false,
        title: searching
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: searchCtrl,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  onChanged: (value) {
                    if (value != '') {
                      defaultstream();
                    } else {
                     defaultstream();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        color: kblack.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            : const TurboText(
                text: '@near',
                fontSize: 23,
                color: kamber,
                fontWeight: FontWeight.w600,
                letterspace: 0.8,
                textAlign: TextAlign.start,
                fontFamily: 'Lob',
              ),
        actions: [
          searching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searching = false;
                    });
                    defaultstream();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: kblack,
                  ))
              : IconButton(
                  onPressed: () {
                    searchCtrl.text = '';
                    setState(() {
                      searching = true;
                    });
                    defaultstream();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: kblack,
                  ))
        ],
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            selectedindex != 2
                ? screens.elementAt(selectedindex ?? 0)
                : screens.elementAt(0),
            Positioned(
              bottom: 20,
              child: Container(
                width: ScreenUtil.screenWidth! * 0.6,
                height: ScreenUtil.screenHeight! * 0.07,
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(color: kblack.withOpacity(0.2), blurRadius: 4)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedindex = 0;
                            searching = false;
                          });
                          defaultstream();
                        },
                        icon: Icon(
                          Icons.home,
                          color: selectedindex == 0
                              ? kblack
                              : kblack.withOpacity(0.5),
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const AddDataScreen(),
                              ));
                        },
                        icon: Container(
                            decoration: const BoxDecoration(
                                color: kblack, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: selectedindex == 2
                                    ? kwhite
                                    : kwhite.withOpacity(0.5),
                                size: 35,
                              ),
                            ))),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedindex = 1;
                            searching = false;
                          });
                          defaultstream();
                        },
                        icon: Icon(
                          Icons.history,
                          color: selectedindex == 1
                              ? kblack
                              : kblack.withOpacity(0.5),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  defaultstream() {
    setState(() {
      stream = FirebaseFirestore.instance
          .collection('items')
          // .where("search",arrayContains: searchCtrl.text)
          .where("status", isEqualTo: selectedindex == 0 ? 1 : 2)
          .snapshots();
    });
  }
}
