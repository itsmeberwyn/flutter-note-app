import 'dart:developer';
import 'package:get/get.dart';
import 'package:note_app/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  var isDataLoading = false.obs;
  RxBool get isLoading => isDataLoading;

  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData(String api) async {
    try {
      isDataLoading(true);
      Response response = await service.getData(api);

      if (response.statusCode == 200) {
        _myData = response.body;
        update();
      } else {
        log("an error occurred");
      }
    } catch (e) {
      log("an error occurred");
    } finally {
      isDataLoading(false);
    }
  }
}
