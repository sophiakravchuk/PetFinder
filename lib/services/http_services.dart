import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'LostForm_model.dart';
import 'package:dio/dio.dart';


class HttpService {
  static const String API_KEY = "d4815e122853326969ff62e32e10c377c8212";
  final String lostFormsURL = "https://petfinder-eafc.restdb.io/rest";
  final Dio _dio = Dio();


  Future<List<LostForm>> getLostForms() async {
    Response res = await _dio.get('$lostFormsURL/forms');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.data);

      List<LostForm> lostForms = body
          .map(
            (dynamic item) => LostForm.fromJson(item),
      )
          .toList();

      return lostForms;
    } else {
      throw "Unable to retrieve LostForms.";
    }
  }

  // Future<void> deleteLostForm(int id) async {
  //   var headers = {
  //     'content-type': "application/json",
  //     'x-apikey': "d4815e122853326969ff62e32e10c377c8212",
  //     'cache-control': "no-cache"
  //   };
  //
  //   _dio.options.headers = headers;
  //   Response res = await _dio.delete("$lostFormsURL/forms/$id");
  //
  //   if (res.statusCode == 200) {
  //     print("DELETED");
  //   } else {
  //     throw "Unable to delete LostForm.";
  //   }
  // }

  Future<void> createLostForm(LostForm lostForm) async {

    var headers = {
      'content-type': "application/json",
      'x-apikey': "d4815e122853326969ff62e32e10c377c8212",
      'cache-control': "no-cache"
    };

    _dio.options.headers = headers;
    final response = await _dio.post(
      lostFormsURL + '/forms',

      data: jsonEncode(lostForm.toJson()),
    );
    if (response.statusCode != 201) {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album ${response.statusCode.toString()}');
    } else {
      print("ok");
    }
  }
}




