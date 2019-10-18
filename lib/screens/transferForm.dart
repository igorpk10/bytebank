import 'package:base/components/Editor.dart';
import 'package:base/models/transfer.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccount.text);
    final double value = double.tryParse(_controllerValue.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating a transfer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerAccount,
                text: "Account Number",
                hint: "0000"),
            Editor(
              controller: _controllerValue,
              text: "Value",
              hint: "0.00",
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              color: Colors.lightBlue,
              child: Text("Confirm"),
              textColor: Colors.white,
              onPressed: () => _createTransfer(context),
            )
          ],
        ),
      ),
    );
  }
}
