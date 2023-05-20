
import 'package:save_knee_23/screens/02_signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '06_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final controller= TextEditingController();
   final controller1=TextEditingController();

   void Login(){
     final _auth=FirebaseAuth.instance;
     final user=_auth.signInWithEmailAndPassword(
         email: controller.text,
         password: controller1.text
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/knee_bg_wide.jpg'))),
            ),
          ),
          Container(
            height: 180.h,
            width: 200.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70)),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 20,),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                    Text(
                      "Back",
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    )
                  ],
                ),
                Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 30.sp),
                )
              ],
            ),
          ),
          Positioned(
            //top: 350,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
              // height: MediaQuery.of(context).size.height*0.6,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "EMAIL",
                        style: TextStyle(fontSize: 10.sp,),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    CustomField(controller),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PASSWORD",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ),
                    TextField(
                        controller: controller1,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffD9D8D8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none))),
                    SizedBox(height: 10.h,),
                    ElevatedButton(onPressed: (){
                      Login();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    },

                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff3E1E82),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size(350, 60)
                        ),
                        child: Text("Login")
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                        child: Text("Forgot Password ?",style: TextStyle(color: Colors.black),)
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                        child: Text("SignUp !",style: TextStyle(color: Color(0xff3E1E82)),))
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}



class CustomField extends StatelessWidget {
  final TextEditingController controller;
  CustomField(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,

            fillColor: Color(0xffD9D8D8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none)));
  }
}
