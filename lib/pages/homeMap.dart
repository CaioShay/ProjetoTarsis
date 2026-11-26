import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:projeto/API/geocoding.dart';

class HomeMap extends StatefulWidget {
  @override
  State<HomeMap> createState() {
    return _HomeMapState();
  }
}

class _HomeMapState extends State<HomeMap>{
  String city = '...';

  Set<Marker> markers = {};

  Future<void> selectLocation(LatLng position) async{
    city = await Geocoding().getCityFromCordinates(position);
    markers = {(Marker(markerId: MarkerId('marcador'+markers.length.toString()),position: position, infoWindow: InfoWindow(title: city)))};
    setState(() {

    });

  }
  
  @override
  Widget build(BuildContext context){
    return Column(children: [
      Text(city,style: TextStyle(fontSize: 24),),
      Expanded(child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(0,0)),
        onTap: selectLocation,
        markers: markers,
      ))
    ],);
  }
}

