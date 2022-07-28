import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class TransactionDB {
  String dbName;

  TransactionDB({required this.dbName});

  Future<String> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLacation = join(appDirectory.path, dbName);
    return dbLacation;
  }
}
