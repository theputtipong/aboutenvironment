// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:http/http.dart' as http;
import 'config.dart';
import 'debug.dart';
import 'model.dart';

class AirvisualApiHub {
  Future<ApiRespond> supportedcountries() async {
    var url = Uri.https('${AirvisualConfig.api}v2/countries?key=${AirvisualConfig.key}');
    http.Response response;
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        return apiRespondFromMap(response.body);
      } else {
        return ApiRespond(status: false, data: Data(message: "api can't get data please try again later"));
      }
    } catch (e) {
      logDebug('api supportedcountries', 'catch $e');
      return ApiRespond(status: false, data: Data(message: e.toString()));
    }
  }
}
