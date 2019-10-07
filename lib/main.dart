import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   home: Scaffold(
     appBar: AppBar(
       title: Text("Hello mean"),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.add),
     ),
     body: Column(
       children: <Widget>[
         Card(
           child: ListTile(
             leading: Icon(Icons.monetization_on),
             title: Text("21,33"),
             subtitle: Text("2000"),
           ),
         ),
       ],
     ),
   ),
));
