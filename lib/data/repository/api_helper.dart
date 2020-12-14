import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/res/startings.dart';


class AppHelper  {
 final String _helpUrl = 'https://pokeapi.co/api/v2/';



  @override
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_helpUrl + url);
      responseJson = json.decode(response.body.toString());
    } on Exception {
      print('Connection error');
    }
    return responseJson;
  }
    }