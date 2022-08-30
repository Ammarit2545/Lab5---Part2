import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Transactions.dart';
import 'package:flutter_application_1/providers/transaction_provider.dart';
import 'package:flutter_application_1/screens/form_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeSccreen extends StatefulWidget {
  const HomeSccreen({Key? key}) : super(key: key);

  @override
  State<HomeSccreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeSccreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("หน้าสูตร"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget? child) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  "วงกลม =22/7 (พาย)xเส้นผ่านศูนย์กลาง \nรูปว่าว = 1/2 x ผลคูนของเส้นทะเเยงมุม\nสามเหลี่ยม =1/2xฐานxสูง\nพื้นที่สี่เหลี่ยมผืนผ้า = กว้างxยาว\nพื้นที่สี่เหลี่ยมผืนผ้า = กว้างxยาว\nพื้นที่สี่เหลี่ยมจตุรัส = ด้านxด้าน\nพื้นที่สี่เหลี่ยมด้านขนาน = ฐานxสูง\nพื้นที่สี่เหลี่ยมขนมเปียกปูน = 0.5xผลคูนของเส้นทแยงมุม\nพื้นที่สี่เหลี่ยมคางหมู = 0.5xผลบวกของด้านคู่ขนานxสูง\nพื้นที่สี่เหลี่ยมด้านไม่เท่า หรือ ใดๆ = 0.5xเส้นทแยงมุมxผลบวกของเส้นกิ่ง",
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(
                            child: Text(data.amount.toString()),
                          ),
                        ),
                        title: Text(data.title),
                        subtitle:
                            Text(DateFormat("dd/MM/yyyy").format(data.date)),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
