
import 'package:flutter/material.dart';
import 'Colors.dart';



InputDecoration AppInputDecoration(label){
  return InputDecoration(
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorGreen,width: 1)
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorGreen,width: 1)
      ),

      border: OutlineInputBorder(),
      labelText: label
  );
}


DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: colorWhite,width: 1),
    borderRadius: BorderRadius.circular(4),

  ),
    child: Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: child,
    ),
  );
}


