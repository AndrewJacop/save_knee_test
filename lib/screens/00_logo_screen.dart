
import 'package:save_knee_23/screens/02_signUp.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '01_loginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', scale: 0.85),
                const SizedBox(height: 15),
                Text(
                  'SAVE\nKnee',
                  style: TextStyle(
                    color: kpLit,
                    fontFamily: 'Benson',
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'get better yourself',
                  style: TextStyle(color: kpLit),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kpDrk,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kpLit),
                        minimumSize:
                        MaterialStateProperty.all(const Size(220, 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: kpLit)))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },

                    child: const Text('Login'),
                  ),
                  SizedBox(height: 15.h,),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kpDrk),
                        minimumSize:
                        MaterialStateProperty.all(const Size(220, 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: kpLit, width: 3.w),
                        ))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
