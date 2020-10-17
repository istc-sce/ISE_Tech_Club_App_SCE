import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController controllerName;

  const TextFieldWidget({this.label,this.maxLines, this.controllerName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        controller: controllerName,
        maxLines: maxLines,
        decoration: new InputDecoration(
          labelText: label,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(
            ),
          ),
          //fillColor: Colors.green
        ),
        validator: (val) {
          if(val.length==0) {
            return "Email cannot be empty";
          }else{
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
