import 'dart:io';

//import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_picker/data/MediaFile.dart';

import 'PickerWidget.dart';

void main() => runApp(MaterialApp(
      title: "App",
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectText = "";

  @override
  void initState() {
    super.initState();
  }

  /*Future<bool> _checkPermission() async {
    final permissionStorageGroup =
        Platform.isIOS ? PermissionGroup.photos : PermissionGroup.storage;
    Map<PermissionGroup, PermissionStatus> res =
        await PermissionHandler().requestPermissions([
      permissionStorageGroup,
    ]);
    return res[permissionStorageGroup] == PermissionStatus.granted;
  }*/

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getMedia() async {
    try {
      List<MediaFile> imageMediaFileList = await FlutterPicker.getImage();
      print("imageMediaFileList");
      print(imageMediaFileList);

      List<MediaFile> videoMediaFileList = await FlutterPicker.getVideo();
      print("videoMediaFileList");
      print(videoMediaFileList);

      MediaFile imageMediaFile1 = await FlutterPicker.getMediaFile(
          fileId: imageMediaFileList[0].id, type: MediaType.IMAGE);
      print("imageMediaFile1");
      print(imageMediaFile1.thumbnailPath);

      MediaFile videoMediaFile1 = await FlutterPicker.getMediaFile(
          fileId: videoMediaFileList[0].id, type: MediaType.VIDEO);
      print("videoMediaFile1");
      print(videoMediaFile1.thumbnailPath);

      if (imageMediaFileList.length > 0) {
        String imageMediaFile2 = await FlutterPicker.getThumbnail(
            fileId: imageMediaFileList[0].id, type: MediaType.IMAGE);
        print("imageMediaFile2");
        print(imageMediaFile2);
      }

      if (videoMediaFileList.length > 0) {
        String videoMediaFile2 = await FlutterPicker.getThumbnail(
            fileId: videoMediaFileList[0].id, type: MediaType.VIDEO);
        print("videoMediaFile2");
        print(videoMediaFile2);
      }
    } on Exception {
      print("Exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: const Text("Show All Media"),
                onPressed: () {
                  FlutterPicker.getAll().then((mediaFiles) {
                    //print(mediaFiles);
                    _awaitReturnValueFromSecondScreen(context, mediaFiles);
                  });
                }),
            RaisedButton(
                child: const Text("Show Image Media"),
                onPressed: () {
                  FlutterPicker.getImage().then((mediaFiles) {
                    //print(mediaFiles);
                    _awaitReturnValueFromSecondScreen(context, mediaFiles);
                  });
                }),
            RaisedButton(
                child: const Text("Show Video Media"),
                onPressed: () {
                  FlutterPicker.getVideo().then((mediaFiles) {
                    //print(mediaFiles);
                    _awaitReturnValueFromSecondScreen(context, mediaFiles);
                  });
                }),
            Text("$selectText")
          ],
        ),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(
      BuildContext context, List<MediaFile> mediaFiles) async {
    // start the SecondScreen and wait for it to finish with a result
    Set<MediaFile> result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PickerWidget(mediaFiles),
        ));

    // after the SecondScreen result comes back update the Text widget with it

    if(result == null)
      {
        return;
      }

    setState(() {
      int size = result.length;
      selectText = "Selected Media Size $size";
    });
  }
}
