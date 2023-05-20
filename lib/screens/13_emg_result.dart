import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '/screens/13_emg_result.dart';
import '/screens/10_xray.dart';
import '06_home_screen.dart';
import '07_home_page.dart';
import '14_private_chat.dart';

class emg_result extends StatelessWidget {
  File? myfile;
  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    final bodyHeight=screenHeight-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    final appBar= PreferredSize(
        preferredSize: Size.fromHeight(.125*bodyHeight),
        child: AppBar(
            backgroundColor: Color(0xffE2E2E2),
            elevation: 0.0,
            leadingWidth: .2*screenWidth,
            leading:  Padding(
              padding: const EdgeInsets.only(left: 8.0).r,
              child: Center(
                child: Ink(height: 200.h,
                  width: 200.w,

                  decoration: ShapeDecoration(shape: CircleBorder(),color:  Color(0xff0D235C)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_outlined,
                        size: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            toolbarHeight:.2*bodyHeight,
            title: Padding(
              padding: EdgeInsets.only(left: 8.r),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff0D235C),
                      borderRadius: BorderRadius.circular(35.r)),
                  height: 0.058*bodyHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Result',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 22.sp)),
                    ],
                  ),
                ),
              ),
            )));
    return Scaffold(backgroundColor: Color(0xff000000),
      appBar: appBar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20.r),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/pexels-joão-jesus-925743.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: .001*screenWidth,vertical: .035*bodyHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage('assets/images/emg.png'),
                              height: .2*bodyHeight,
                              width: 0.5*screenWidth),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 0.06*screenWidth),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  gradient: LinearGradient(
                                      colors: [Color(0xff0D235C), Colors.black])),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(width: .9*screenWidth,height: .35*bodyHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsetsDirectional.fromSTEB(.17*screenWidth, 0, 0, 0),
                    child: Container(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                        },
                        icon: Icon(Icons.home, size: 40, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsetsDirectional.fromSTEB(.5*screenWidth, 0, 0, 0),
                    child: Container(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                        },
                        icon: Icon(Icons.ondemand_video,
                            size: 40, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15).w ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(.23*screenWidth, 0, 0, 0),
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                          },
                          icon: Icon(Icons.menu_book_outlined,
                              size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(.3*screenWidth, 0, 0, 0),
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Chat();
                                }));
                          },
                          icon: Icon(Icons.chat_bubble_outline,
                              size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
