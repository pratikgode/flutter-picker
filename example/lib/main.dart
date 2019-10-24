import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_picker/data/MediaFile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    /* try {
      List<MediaFile> data= await FlutterPicker.getImage();
      print("getImage");
      print(data);
    } on Exception {

    }*/

   /* try {
      List<MediaFile> data= await FlutterPicker.getVideo();
      print("getVideo");
      print(data);
    } on Exception {

    }*/

   /*  try {
      MediaFile data = await FlutterPicker.getMediaFile(fileId: '293990', type: MediaType.IMAGE);
      print("getMediaFile");
      print(data.thumbnailPath);
    } on Exception {
       print("Exception");
    }*/

  /*  try {
      String data = await FlutterPicker.getThumbnail(fileId: '293990', type: MediaType.IMAGE);
      print("getThumbnail");
      print(data);
    } on Exception {

    }*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('App Running on'),
        ),
      ),
    );
  }
}
