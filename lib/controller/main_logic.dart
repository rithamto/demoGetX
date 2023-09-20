import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
class MainLogic extends GetxController{
  RxString url = "".obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async{
    url.value = await getImageURL();
  }
  
  Future<dynamic> getImageURL() async {
    var client = HttpClient();
    var uri = Uri.parse('https://api.thecatapi.com/v1/images/search');
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    var data = await response.transform(utf8.decoder).join();
    var map = json.decode(data);
    return map[0]['url'].toString();
  }
}