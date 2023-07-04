import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class ModelServices {
  Future<List<Model>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return modelFromJson(json);
    }
    return null;
  }
}
