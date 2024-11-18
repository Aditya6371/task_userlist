import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

class ApiMethods {
  ApiMethods._();
  static Future getApi(
    String url,
    Map<String, String>? headers,
  ) async {
    try {
      final response = await get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        log(decodedData.toString());
        return decodedData;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("Expection Caught $e");
    }
  }

  static Future postApi(String url, Map<String, String> headers,
      Map<String, dynamic> payload) async {
    try {
      final response = await post(
        Uri.parse(url),
        headers: headers,
        body: payload,
      );
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("Expection Caught $e");
    }
  }
}
