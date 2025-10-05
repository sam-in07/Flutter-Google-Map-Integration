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
      //
      bearing: 0 ,
    //koto degree oita show korbe
  );
  // Dhaka to Rangpure
  static const LatLng dhaka=LatLng(23.8103, 90.4125);
  static const LatLng rangpur=LatLng(23.8103, 90.4125);

  //marker banabo eta set typer data
  final Set<Marker> mapMarker={
    const Marker(
        markerId: MarkerId('dhaka'),
        position:  dhaka,
        infoWindow: InfoWindow(title: "Dhaka")
        //infowindow marker upor pont korle ki show korbw oita
    ),
    const Marker(
        markerId: MarkerId('rangpur'),
        position:  rangpur,
        infoWindow: InfoWindow(title: "Dhaka")
    ),
  };

  // route points
  static const List<LatLng> route_points=[
    LatLng(23.8103, 90.4125), // Dhaka
    LatLng(24.0020, 90.4200), // Gazipur area
    LatLng(24.2500, 89.9200), // Tangail area
    LatLng(24.4500, 89.7000), // Jamuna bridge / Sirajganj area
    LatLng(24.8500, 89.3700), // Bogura area
    LatLng(25.2000, 89.5200), // Gobindaganj / Gaibandha area
    LatLng(25.4500, 89.3500), // Pirganj area
    LatLng(25.6500, 89.3000), // Rangpur outskirts
    LatLng(25.7439, 89.2752), // Rangpur
  ];
  // create a line  route point gulake ney korte hobe
  final Set<Polyline> mapLines={
    const Polyline(
      polylineId: PolylineId("dhaka-rang"),
      width: 5,
      color: Colors.blue,
      points: route_points,
    ),
  };

  // On Event Show Snacbar
  void ShowSnackBar(BuildContext context,String msg){
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




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
       mapType: MapType.hybrid,
       // mapType: MapType.normal,

       // mapType: MapType.satellite,
        trafficEnabled: true,
        markers: mapMarker,
        polylines: mapLines,
        //map modhe keo tap korle ki korbooo
        onTap: (pos)=>ShowSnackBar(context,pos.toString()),
        onLongPress: (pos)=>ShowSnackBar(context,pos.toString()),


      ),
    );
  }
}
