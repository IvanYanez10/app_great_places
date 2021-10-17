import 'package:flutter/material.dart';
import '../widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  late File _pickedImage;

  void _selectedImage(File pickedImage){
    _pickedImage = _pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage==null){
      //add error handler
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 10,),
                    ImageInput(_selectedImage)
                  ],
                ),
              ),
            )
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: _savePlace,
            label: const Text('Add place'),
            style: ElevatedButton.styleFrom(
              // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              primary: Theme.of(context).accentColor,
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              elevation: 0,
            ),
          )
        ],
      ),
    );
  }
}
