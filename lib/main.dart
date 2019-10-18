import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/transferForm.dart';
import 'screens/transferList.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferList(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.blueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}
