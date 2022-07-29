import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import 'package:flutter_application_1/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "Transaction.db");
    //Show
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTrasaction(statement) async {
    //var db = TransactionDB(dbName: "Transactions.db").openDatabase();
    //print(db);
    var db = TransactionDB(dbName: "Transaction.db");

    await db.InsertData(statement);

    //Show
    transactions = await db.loadAllData();

    // transactions.insert(0, statement);

    notifyListeners();
  }
}
