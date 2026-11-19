import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class HomeMap extends StatefulWidget {
  @override
  State<HomeMap> createState() {
    return _HomeMapState();
  }
}

class _HomeMapState extends State<HomeMap>{
  Set<Marker> markers = {};

  void selectLocation(LatLng position){
    markers = {(Marker(markerId: MarkerId('marcador'+markers.length.toString()),position: position, infoWindow: InfoWindow(title: 'Tommeeee')))};
    setState(() {

    });

  }
  
  @override
  Widget build(BuildContext context){
    return GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0,0)),
      onTap: selectLocation,
      markers: markers,
    );
  }
}

