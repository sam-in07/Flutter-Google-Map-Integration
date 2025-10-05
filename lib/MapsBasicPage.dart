import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapsbasicpage extends StatefulWidget {
  const Mapsbasicpage({super.key});

  @override
  State<Mapsbasicpage> createState() => _MapsbasicpageState();
}

class _MapsbasicpageState extends State<Mapsbasicpage> {
  // initialCameraPosition
  // camera koto angel koi theke show korbe
  static const initialPosition=CameraPosition(
    //
      target: LatLng(23.777176, 90.399452),

      zoom: 10,

      tilt: 0,
      bearing: 0
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: GoogleMap(
        //main attribute
      initialCameraPosition: initialPosition,
      //pera nai tmn
      myLocationEnabled: true,
       myLocationButtonEnabled: true,
       compassEnabled: true,
       zoomControlsEnabled: true,
       mapType: MapType.normal,
      ),
    );
  }
}
