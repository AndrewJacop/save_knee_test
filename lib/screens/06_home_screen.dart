import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:save_knee_23/screens/10_xray.dart';
import 'package:save_knee_23/screens/12_emg.dart';
import 'package:url_launcher/url_launcher.dart';

import '/scratch.dart';
import '15_chat_page.dart';

late User user;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bodyHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Color(0xff0D235C)), label: " Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.xRay,
                color: Color(0xff0D235C),
              ),
              label: "X-Ray"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.fileWaveform,
                color: Color(0xff0D235C),
              ),
              label: "EMG")
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ChatPage();
                }));
              }
              break;
            case 1:
              if (_selectedIndex == index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return xray();
                }));
              }
              break;
            case 2:
              if (_selectedIndex == index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return emg();
                }));
              }
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                    Color(0xFFc5cae9),
                    Color(0xffD4CFC8),
                    // Color(0xFF7986cb),
                    Color(0xFFdcf4ff),
                    Color(0xffced5e8),
                    Color(0xFFc5cae9),
                    Color(0xFFc5cae9),
                  ])),
            ),
            Container(
              height: bodyHeight * .17,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Color(0xff949398),
                color: Color(0xff0D235C),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30).w,
                    bottomRight: Radius.circular(30).w),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15).w,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: bodyHeight * .05,
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hi...!${user!.displayName}",
                                  style: TextStyle(
                                    color: Color(0xfffec102),
                                    fontSize: 25.sp,
                                  )),
                              Text(
                                "Find Your Doctor",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                          ),
                        ]),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.w, horizontal: 0.h),
                      child: SizedBox(
                        height: bodyHeight * .045,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              suffixIcon: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                              hintText: "Search....",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10).w,
                              )),
                        ),
                      ),
                    ),
                    Text(
                      "Continue Excercising",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.sp),
                    ),
                    SizedBox(
                      height: bodyHeight * .01,
                    ),
                    Container(
                      height: bodyHeight * .2,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: urlList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MyCard(urlList[index]);
                        },
                      ),
                    ),
                    Text(
                      "Last Related Doctors",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.sp),
                    ),
                    Container(
                      height: bodyHeight * .45,

                      /*decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),*/
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: drList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DoctorCard(
                              drList[index].imgPath,
                              drList[index].name,
                              drList[index].department,
                              drList[index].rate);
                        },
                      ),
                    ),
                    Text(
                      "Last Contacted Doctors",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.sp),
                    ),
                    Container(
                      height: bodyHeight * .4,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: drList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ContantedDoc(
                                drList[index].rate,
                                drList[index].imgPath,
                                drList[index].salary,
                                drList[index].name);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget MyCard(String url) {
  String id = url.substring(url.length - 11);
  String urlLink = "https://img.youtube.com/vi/${id}/0.jpg";
  return GestureDetector(
    onTap: () {
      launchUrl(Uri.parse(url));
    },
    child: Card(
      child: Image.network("${urlLink}"),
    ),
  );
}

Widget DoctorCard(String imgPath, String name, String dep, double rate) {
  return Padding(
    padding: const EdgeInsets.all(8.0).w,
    child: GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20).w,
        child: Container(
          // height: 50,
          color: Color(0xffeaeaea),
          width: 170.w,

          /*decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Color(0xffeaeaea)
              //0xffD9DAD6)
              //(0xffE5E1DA),
              ),*/
          child: Column(
            children: [
              Image.network(imgPath),
              Padding(
                padding: const EdgeInsets.only(top: 1.5).w,
                child: Text(
                  name,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ),
              Text(dep),
              Padding(
                padding: const EdgeInsets.only(top: 3.0).w,
                child: RatingBarIndicator(
                  rating: rate,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30,
                  direction: Axis.horizontal,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget ContantedDoc(double rate, String imgPath, int salary, String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0).w,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20).w,
      child: GestureDetector(
        child: Container(
          color: Color(0xffeaeaea),
          width: 170.w,
          child: Padding(
            padding: const EdgeInsets.all(10).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border, color: Colors.red),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(rate.toString()),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage: NetworkImage(imgPath),
                ),
                Text(
                  name,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Text(
                  "\$ ${salary}/hours",
                  style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
