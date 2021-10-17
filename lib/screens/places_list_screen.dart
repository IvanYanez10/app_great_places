import 'package:flutter/material.dart';
import './add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (_, greatPlaces, ch) => greatPlaces.items.isEmpty
          ? Center(child: const Text('No hay lugares'))
          : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(backgroundImage: FileImage(greatPlaces.items[i].image)),
              title: Text(greatPlaces.items[i].title),
              onTap: (){},
            )
        )
      )
    );
  }
}

