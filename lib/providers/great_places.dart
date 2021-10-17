import 'package:flutter/foundation.dart';
import 'dart:io';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage){
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: PlaceLocation(latitude: 20.0, longitude: 30.0),
        image: pickedImage
    );
    _items.add(newPlace);
    notifyListeners();
  }

}