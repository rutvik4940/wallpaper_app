import 'dart:convert';

import '../screen/model/home_model.dart';
import 'package:http/http.dart' as http;

class APIHelper
{
  static APIHelper helper = APIHelper._();

  APIHelper._();
  Future<AnimalModel?> animalData(String wallpaper) async {
    String link = "https://pixabay.com/api/?key=43283061-9a070c8081498dd406a350b60&q=$wallpaper";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      AnimalModel animal = AnimalModel.mapToModel(json);
      return animal;
    }
    return null;
  }
}