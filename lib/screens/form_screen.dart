import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  //const FormScreen({Key? key}) : super(key: key);
  //controller
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                    autofocus: true,
                    controller: titleController,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "กรุณาป้อนชื่อรายการ";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "กรุณาป้อนจำนวนเงิน";
                      }
                      if (double.parse(str) <= 0) {
                        return "กรุณาป้อนราคามากกว่า 0";
                      }
                      return null;
                    },
                  ),
                  FlatButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text("เพิ่มข้อมูล"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var title = titleController.text;
                        var amount = amountController.text;

                        print(title);
                        print(amount);

                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              )),
        ));
  }
}
