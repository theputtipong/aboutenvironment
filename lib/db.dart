import 'dart:async';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'config.dart';
import 'debug.dart';
// import 'debug.dart';

class DBApp {
  Future<bool> createsembast() async {
    try {
      DatabaseFactory dbFactory = databaseFactoryIo;
      Database db = await dbFactory.openDatabase(DatabaseConfig.dbCountries);
      logDebug('db createsembast', db.path.toString());
      return true;
    } on Exception catch (e) {
      logDebug('db createsembast', 'catch ${e.toString()}');
      return false;
    }
  }
}
