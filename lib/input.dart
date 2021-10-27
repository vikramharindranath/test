import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:smartyx_receipts/resultslist.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  static const String screen = "input";

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  static File? _image;
  static File? _image2;
  final picker = ImagePicker();

  Dio dio = new Dio();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1.5, ratioY: 2.0),
          compressQuality: 100,
          maxHeight: 700,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg);

      setState(() {
        if (croppedFile != null) {
          _image = File(croppedFile.path);
        } else {
          print('No image from camera captured.');
        }
      });
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //final List<XFile>? pickedFile = await picker.pickMultiImage();
    if (pickedFile != null) {
      final croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 2.0),
          compressQuality: 100,
          maxHeight: 700,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg);

      setState(() {
        if (croppedFile != null) {
          _image = File(croppedFile.path);
        } else {
          print('No image from gallery selected.');
        }
      });
    }
  }

  Future getImageFromGallery2() async {
    final pickedFile2 = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile2 != null) {
      final croppedFile2 = await ImageCropper.cropImage(
          sourcePath: pickedFile2.path,
          aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 2.0),
          compressQuality: 100,
          maxHeight: 700,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg);

      setState(() {
        if (croppedFile2 != null) {
          _image2 = File(croppedFile2.path);
        } else {
          print('No image from gallery selected.');
        }
      });
    }
  }

  Future displayImage() async {
    if (_image != null) {
      return Image.file(_image!, width: 400, height: 400, fit: BoxFit.cover);
    } else {
      Text('Error while uploading the image',
          style: new TextStyle(fontSize: 10.0, color: Colors.white));
    }
  }

  Future sendData() async {
    try {
      String filename = _image!.path.split('/').last;
      print(filename);
      final apiurl = 'http://127.0.0.1:8000/api/';
      FormData formData = new FormData.fromMap({
        'image': await MultipartFile.fromFile(_image!.path,
            filename: filename, contentType: MediaType('image', 'jpg')),
        'image2': await MultipartFile.fromFile(_image2!.path,
            filename: filename, contentType: MediaType('image', 'jpg')),
        'title': DateTime.now()
      });
      //final postImageModel pim = postImageModel(id: 5, title: 'title', image: 'image')
      Response response = await dio.post(apiurl,
          data: formData,
          options: Options(
            headers: {"Content-Type": "multipart/form-data"},
          ));
      print(response.statusCode);
    } catch (e) {
      if (e is DioError) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bgdark.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/logo.png"),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        getImageFromCamera();
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          width: 50.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Get Image from Camera",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: new Text(
                    "Select Image from Gallery",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF16B0C4).withOpacity(0.7)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 3.0, top: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        getImageFromGallery();
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(27.0)),
                          child: new Text("First Image*",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 20.0, top: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        getImageFromGallery2();
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(27.0)),
                          child: new Text("Second Image",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: _image == null
                      ? new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 7.0, bottom: 3.0),
                              child: new Text(
                                "No image selected to display",
                                style: new TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white.withOpacity(0.65)),
                              ),
                            )
                          ],
                        )
                      : Image.file(_image!,
                          width: 250, height: 350, fit: BoxFit.contain),
                ),
                Expanded(
                  child: _image2 == null
                      ? new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 7.0, bottom: 3.0),
                              child: new Text(
                                "No image selected to display",
                                style: new TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white.withOpacity(0.65)),
                              ),
                            )
                          ],
                        )
                      : Image.file(_image2!,
                          width: 250, height: 350, fit: BoxFit.contain),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrintingResultsPage(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          width: 50.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Proceed to Extract",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
