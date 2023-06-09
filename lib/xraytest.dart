import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class MyTestPage extends StatefulWidget {
  @override
  _MyTestPageState createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
  late Future<File> imageFile;
  File? _image;
  String result = '';
  late ImagePicker imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadModelFiles();
  }

  //TODO load model files
  loadModelFiles() async {
    String? res = await Tflite.loadModel(
        model: 'assets/model/model_unquant.tflite',
        labels: 'assets/model/labels.txt',
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    print(res);
  }

  //run inference and show results
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
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/check.png'), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Stack(children: <Widget>[
              Stack(children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/images/knee_bg_wide.jpg',
                    height: 210,
                    width: 200,
                  ),
                ),
              ]),
              Center(
                child: TextButton(
                  onPressed: _imgFromGallery,
                  onLongPress: _imgFromCamera,
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 133,
                            height: 198,
                            fit: BoxFit.fill,
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
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '$result',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'finger_paint', fontSize: 26.sp),
            ),
          ),
        ],
      ),
    )));
  }
}
