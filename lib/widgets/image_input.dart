import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  ImageInput(this.onSelectedImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late File _storedImage;
  bool _isPhoto = false;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600
    );
    setState(() {
      _storedImage = File(imageFile!.path);
      _isPhoto = true;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final saveImage = await _storedImage.copy('${appDir.path}/$fileName');
    widget.onSelectedImage(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey)
        ),
        child: _isPhoto
            ? Image.file(_storedImage, fit: BoxFit.cover, width: double.infinity,)
            : const Text('Sin imagen previa', textAlign: TextAlign.center,),
        alignment: Alignment.center,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: TextButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Take pic'),
          style: TextButton.styleFrom(
            primary: Theme.of(context).accentColor,
          ),
          onPressed: _takePicture
        ),
      )
    ]);
  }
}
