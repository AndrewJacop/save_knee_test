import 'package:save_knee_23/screens/00_logo_screen.dart';
import 'package:save_knee_23/screens/04_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class K_ost extends StatefulWidget {
  const K_ost({Key? key}) : super(key: key);
  @override
  State<K_ost> createState() => _K_ostState();
}

class _K_ostState extends State<K_ost> {
  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    final bodyHeight=screenHeight-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Stack(children: [
        Container(
          // height: 1000,
          //width: 2000,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment(0, 0),
                colors: [
                  Color(0xFFfba867),
                  //Color(0xFFff8a65),
                  Color(0xFFc5cae9),
                  // Color(0xFFfba867),
                  Color(0xFF7986cb),
                  Color(0xFFc5cae9),
                ]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: bodyHeight*.03,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogoScreen()));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )),
              SizedBox(
                height: bodyHeight*.03,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100.r,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/image.png',
                  ),
                  radius: 95.r,
                ),
              ),
              SizedBox(
                height: bodyHeight*.08,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: bodyHeight*.53,
                    // width: 1200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30).w,
                            topRight: Radius.circular(30).w),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /* Text(
                          ("Choose"),
                          style: TextStyle(fontSize: 60),
                        ),
                        SizedBox(
                          height: 10,
                        ),*/

                          Text(
                            ("What is Knee"),
                            style: TextStyle(fontSize: 28.sp),
                          ),
                          Text(
                            "Osteoarthritis?",
                            style: TextStyle(
                                color: Color(0xFF00174d),
                                fontSize: 38.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10).w,
                            child: Text("Osteoarthritis of the knee happens when cartilage in your knee joint breaks down. when this happens, the bones in your knee joint rub together, causing friction that makes your knees hurt, become stiff or swell. Osteoarthritis in the knee can't be cured but there are treatments that can relieve symptoms and slow your condition 's progress.",
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseDoc()));
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF00174d),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 55.h, vertical: 17.w),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20).w,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
