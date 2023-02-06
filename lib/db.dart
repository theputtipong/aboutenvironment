import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'config.dart';
import 'debug.dart';

class DBApp {
  Future<bool> createsembast() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      var dbPath = join(dir.path, DatabaseConfig.dbCountries);
      var db = await databaseFactoryIo.openDatabase(dbPath);
      logDebug('db createsembast', db.path.toString());
      return true;
    } catch (e) {
      logDebug('db createsembast', 'catch $e');
      return false;
    }
  }
}
