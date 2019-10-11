import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating a transfer"),
      ),
      body: Column(
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
            onPressed: () => _createTransfer(),
          )
        ],
      ),
    );
  }

  void _createTransfer() {
    final int accountNumber = int.tryParse(_controllerAccount.text);
    final double value = double.tryParse(_controllerValue.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
    }
  }

}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String hint;
  final IconData icon;

  Editor({this.controller, this.text, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: text,
          hintText: hint,
        ),
        style: TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello mean"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {},
      ),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(100.0, 100)),
        ],
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return "Value:$value -- AccountNumber:$accountNumber";
  }
}
