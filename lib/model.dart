import 'dart:convert';

ApiRespond apiRespondFromMap(String str) => ApiRespond.fromMap(json.decode(str));

String apiRespondToMap(ApiRespond data) => json.encode(data.toMap());

class ApiRespond {
  ApiRespond({
    this.status,
    required this.data,
  });

  bool? status;
  Data data;

  factory ApiRespond.fromMap(Map<String, dynamic> json) => ApiRespond(
        status: json["status"] ?? false,
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    this.message,
  });

  String? message;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
