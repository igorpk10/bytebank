import 'package:flutter/material.dart';

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
