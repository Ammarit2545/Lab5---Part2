import 'dart:io';
import 'package:flutter_application_1/models/Transactions.dart';
import 'package:flutter_application_1/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../models/Transactions.dart';

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

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = await intMapStoreFactory.store("Expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    /* List transactionList =  List<Transactions>();

    for (var record in snapshot) {
      transactionList.add(
        Transactions(
          title: record["title"],
          amount: record["amount"],
          date: DateTime.parse(record["date"])
          )
      );
    }

   // print(snapshot);
    return transactionList;*/
  }
}
