import 'package:get/get.dart';

const String baseUrl = "https://63c61213e1292e5bea2f7534.mockapi.io/api/v1/";

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String api) async {
    var url = baseUrl + api;
    var headers = {'Content-Type': 'application/json; charset=utf-8'};
    final response = await get(
      url,
      headers: headers,
    );
    return response;
  }
}
