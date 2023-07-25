import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes/utilities/constant.dart';

class Network {
  static getAuthor() async {
    final List<Object> arrayOfAuthorData =[];
    http.Response response = await http.get(
      Uri.parse(constGetTextsApi),
    );
    if (response.statusCode == 200) {
      final authorInJson = jsonDecode(response.body);
      arrayOfAuthorData.add(authorInJson['author']);
      arrayOfAuthorData.add(authorInJson['content']);
      arrayOfAuthorData.add(authorInJson['tags']);

      return arrayOfAuthorData;
    }
  }

  static getImage(tag) async {

    String urlForImage = Network.getUrlWithCategory(tag);
    http.Response response = await http.get(
      Uri.parse(urlForImage),
    );
    if (response.statusCode == 200) {
      final imageInJson = jsonDecode(response.body);
      return imageInJson['url'];
    }
  }

  static String getUrlWithCategory(tag){
    return "https://random.imagecdn.app/v1/image?width=500&height=150&category=$tag&format=json";

  }
}
