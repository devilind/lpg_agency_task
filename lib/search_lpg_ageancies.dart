import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lpg_agaency_task/geolocator.dart';

Future<List<String>> searchLpgAgencies() async {
  Position position = await determinePosition();
  double latitude = position.latitude;
  double longitude = position.longitude;
  var dio = Dio();
  var url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
  var parameters = {
    'key': 'AIzaSyD1F2jNI0WeW8xRfqwzh1wIROVM_kcMkrU',
    'location': '$latitude,$longitude',
    'radius': '50000000',
    'keyword': 'restaurant'
  };

  var response = await dio.get(url, queryParameters: parameters);
  var res = response.data['results']
      .map<String>((result) => result['name'].toString())
      .toList();
  print('$latitude,$longitude');
  print(response);
  return res;
}
