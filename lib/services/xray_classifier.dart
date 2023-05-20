import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class XrayClassifier {
  late Future<File> imageFile;
  File? _image;
  String result = '';
  late ImagePicker imagePicker;

  init() {
    imagePicker = ImagePicker();
    loadModelFiles();
  }

  loadModelFiles() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
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
    result = "";
    recognitions.forEach((re) {
      print(re.toString());
      result += re["label"] +
          "Grade " +
          (re["confidence"] as double).toStringAsFixed(2) +
          "\n";
    });
  }

  _imgFromCamera() async {
    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);
    _image = File(pickedFile!.path);
    _image;
    doImageClassification();
  }

  _imgFromGallery() async {
    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    _image;
    doImageClassification();
  }
}
