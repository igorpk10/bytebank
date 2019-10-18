import 'package:base/models/transfer.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _listTransfers = List();

  @override
  State<StatefulWidget> createState() {
    return ListTransferState();
  }
}

class ListTransferState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then((receivedTransfer) {
            debugPrint("$receivedTransfer");
            if (receivedTransfer != null) {
              Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  widget._listTransfers.add(receivedTransfer);
                });
              });
            }
          });
        },
      ),
      body: ListView.builder(
        itemCount: widget._listTransfers.length,
        itemBuilder: (context, index) {
          return TransferItem(widget._listTransfers[index]);
        },
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
