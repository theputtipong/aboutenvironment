import 'package:dio/dio.dart';
import 'config.dart';
import 'debug.dart';
import 'model.dart';

class AirvisualApiHub {
  Future<ApiRespond> supportedcountries() async {
    var dio = Dio();
    try {
      final response = await dio.get('${AirvisualConfig.api}v2/countries?key=${AirvisualConfig.key}');
      if (response.statusCode == 200) {
        return apiRespondFromMap(response.data);
      } else {
        return ApiRespond(status: false, data: Data(message: "api can't get data please try again later"));
      }
    } on Exception catch (e) {
      logDebug('api supportedcountries', 'catch ${e.toString()}');
      return ApiRespond(status: false, data: Data(message: e.toString()));
    }
  }
}
