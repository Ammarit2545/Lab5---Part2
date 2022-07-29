import 'dart:io';
import 'package:flutter_application_1/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String dbName;

  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLacation = join(appDirectory.path, dbName);
    //Make DBMS

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLacation);
    return db;
  }

  InsertData(Transactions statement) async {
    //DBMS  => STORE
    var db = await this.openDatabase();
    var store = await intMapStoreFactory.store("Expense");
    //JSON

    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }
}
