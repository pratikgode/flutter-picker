# flutter_media_picker
Flutter plugin to get All Media.It also allows you to select both images and videos if you wish

## Installation

First, add `flutter_media_picker` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```
flutter_media_picker: ^1.0.0
```

## Example
```
  Future<void> getMedia() async {
     try {
       List<MediaFile> imageMediaFileList = await FlutterMediaPicker.getImage();
 
       List<MediaFile> videoMediaFileList = await FlutterMediaPicker.getVideo();
 
       if (imageMediaFileList.length > 0) {
         MediaFile imageMedia = await FlutterMediaPicker.getMediaFile(
             fileId: imageMediaFileList[0].id, type: MediaType.IMAGE);
       }
 
       if (videoMediaFileList.length > 0) {
         MediaFile videoMedia = await FlutterMediaPicker.getMediaFile(
             fileId: videoMediaFileList[0].id, type: MediaType.VIDEO);
       }
 
       if (imageMediaFileList.length > 0) {
         String imageMedia = await FlutterMediaPicker.getThumbnail(
             fileId: imageMediaFileList[0].id, type: MediaType.IMAGE);
       }
 
       if (videoMediaFileList.length > 0) {
         String videoMedia = await FlutterMediaPicker.getThumbnail(
             fileId: videoMediaFileList[0].id, type: MediaType.VIDEO);
       }
     } on Exception {
       print("Exception");
     }
   }

```