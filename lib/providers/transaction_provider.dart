import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import 'package:flutter_application_1/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTrasaction(statement) {
    //var db = TransactionDB(dbName: "Transactions.db").openDatabase();
    //print(db);
    var db = TransactionDB(dbName: "Transaction.db");
    db.InsertData(statement);
    transactions.insert(0, statement);

    notifyListeners();
  }
}
