import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_picker/data/MediaFile.dart';
import 'GalleryWidget.dart';
import 'MultiSelectorModel.dart';
import 'package:flutter_picker/flutter_picker.dart';

class PickerWidget extends StatefulWidget {

  List<MediaFile> mediaFiles;

  PickerWidget(this.mediaFiles);

  @override
  State<StatefulWidget> createState() => PickerWidgetState();
}

class PickerWidgetState extends State<PickerWidget> {

  MultiSelectorModel _selector = MultiSelectorModel();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Media Picker"),
        ),
        body: Center(
          child: _buildWidget(),
        ));
  }

  _buildWidget() {
    return ChangeNotifierProvider<MultiSelectorModel>(
      builder: (context) => _selector,
      child: Container(
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    textColor: Colors.blue,
                    onPressed: () => onCancel(),
                    child: Text("Cancel"),
                  ),
                ),
                Consumer<MultiSelectorModel>(
                  builder: (context, selector, child) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 60),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        textColor: Colors.blue,
                        onPressed: () => onDone(_selector.selectedItems),
                        child: Text(
                          "Done (${selector.selectedItems.length})",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            GalleryWidget(mediaFiles: widget.mediaFiles),
          ],
        ),
      ),
    );
  }

  onDone(Set<MediaFile> selectedFiles) {
    Navigator.pop(context,selectedFiles);
  }

  onCancel() {
    Navigator.pop(context);
  }
}
