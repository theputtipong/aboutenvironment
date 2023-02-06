// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'config.dart';
import 'debug.dart';
import 'model.dart';

class AirvisualApiHub {
  Future<ApiRespond> supportedcountries() async {
    var dio = Dio(), response;
    try {
      response = await dio.get('${AirvisualConfig.api}v2/countries?key=${AirvisualConfig.key}');
      if (response.statusCode == 200) {
        return apiRespondFromMap(response.data);
      } else {
        return ApiRespond(status: false, data: Data(message: "api can't get data please try again later"));
      }
    } catch (e) {
      logDebug('api supportedcountries', 'catch $e');
      return ApiRespond(status: false, data: Data(message: e.toString()));
    }
  }
}
