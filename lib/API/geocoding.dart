import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

class Geocoding {
  Future<String> getCityFromCordinates(LatLng pos)async{
    try{

      var response = await Dio().get('https://nominatim.openstreetmap.org/reverse?lat=${pos.latitude}&lon=${pos.longitude}&format=json',options: Options(
        headers: {
          'User-Agent': 'School Project (cssb1@aluno.ifal.edu.br)'
        }
      ));
      return response.data['address']['city_district'];

    }catch(e){
        print(e);
    }

    return 'Error';
  }
}