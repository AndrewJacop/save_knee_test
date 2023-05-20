import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '/screens/11_xray_result.dart';

class xray extends StatefulWidget {
  @override
  State<xray> createState() => _xrayState();
}

class _xrayState extends State<xray> {
  File? _image;
  late Future<File> imageFile;
  String result = '';
  late ImagePicker imagePicker;

  loadModelFiles() async {
    String? res = await Tflite.loadModel(
        model: "assets/model/model_unquant.tflite",
        labels: "assets/model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    print(res);
  }

  doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
        path: _image!.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.1, // defaults to 0.1
        asynch: true // defaults to true
        );
    print(recognitions!.length.toString());
    setState(() {
      result = "";
    });
    recognitions.forEach((re) {
      setState(() {
        print(re.toString());
        result += re["label"] +
            "Grade " +
            (re["confidence"] as double).toStringAsFixed(2) +
            "\n";
      });
    });
  }

  _imgFromCamera() async {
    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  _imgFromGallery() async {
    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    setState(() {
      _image;
      doImageClassification();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadModelFiles();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bodyHeight = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    final appBar = PreferredSize(
        preferredSize: Size.fromHeight(.125 * bodyHeight),
        child: AppBar(
            backgroundColor: const Color(0xffE2E2E2),
            elevation: 0.0,
            leadingWidth: .2 * screenWidth,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0).r,
              child: Center(
                child: Ink(
                  height: 200.h,
                  width: 200.w,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: Color(0xff0D235C)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_outlined,
                        size: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            toolbarHeight: .2 * bodyHeight,
            title: Padding(
              padding: const EdgeInsets.only(left: 10).r,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff0D235C),
                      borderRadius: BorderRadius.circular(35).w),
                  height: .055 * bodyHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your X-ray',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.sp)),
                    ],
                  ),
                ),
              ),
            )));

    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: appBar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/pexels-joão-jesus-925743.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: .05 * screenWidth,
                      vertical: .09 * bodyHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 100.r,
                            backgroundColor: Color(0xff0D235C),
                            child: CircleAvatar(
                              radius: 95.r,
                              backgroundImage:
                                  AssetImage('assets/images/Picture1.png'),
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: _image != null
                                    ? Image.file(
                                        _image!,
                                        width: 133,
                                        height: 198,
                                        fit: BoxFit.contain,
                                      )
                                    : Container(
                                        width: 140,
                                        height: 190,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: .25 * bodyHeight),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0).w,
                                  gradient: LinearGradient(colors: [
                                    Color(0xff0D235C),
                                    Colors.black
                                  ])),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff0D235C),
                                    fixedSize: Size(
                                        .5 * screenWidth, .05 * bodyHeight),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                              height: .250 * bodyHeight,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                    Color(0xff101010),
                                                    Color(0xff0D235C),
                                                    Colors.black
                                                  ])),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: .015 * bodyHeight),
                                                    child: Container(
                                                        height:
                                                            0.03 * bodyHeight,
                                                        width:
                                                            0.5 * screenWidth,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                        .circular(
                                                                            25)
                                                                    .w,
                                                            gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                  Colors.black,
                                                                  Color(
                                                                      0xff0D235C),
                                                                  Colors.black87
                                                                ])),
                                                        child: Center(
                                                            child: Text(
                                                          'Please Choose Image',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.sp),
                                                        ))),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                _imgFromGallery();
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                              40.0)
                                                                          .w,
                                                                ),
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: .025 *
                                                                          bodyHeight,
                                                                      left: .17 *
                                                                          screenWidth),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          'assets/images/gallery.png'),
                                                                      height: .080 *
                                                                          bodyHeight),
                                                                ),
                                                              )),
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: .170 *
                                                                    screenWidth,
                                                                top: .010 *
                                                                    bodyHeight),
                                                            child: Text(
                                                              "Gallery",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18.sp,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                _imgFromCamera();
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                              25.0)
                                                                          .w,
                                                                ),
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: .04 *
                                                                          bodyHeight,
                                                                      left: .350 *
                                                                          screenWidth),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          'assets/images/camera.jpg'),
                                                                      height: .06 *
                                                                          bodyHeight),
                                                                ),
                                                              )),
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: .35 *
                                                                    screenWidth,
                                                                top: .02 *
                                                                    bodyHeight),
                                                            child: Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18.sp,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ));
                                  },
                                  child: Text(
                                    'Choose X-ray Image',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              '$result',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'finger_paint', fontSize: 26),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: .03 * bodyHeight),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff0D235C),
                                borderRadius: BorderRadius.circular(25.0).w,
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff0D235C),
                                    fixedSize: Size(
                                        .3 * screenWidth, .02 * bodyHeight),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return xray_result(_image, result);
                                    }));
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
