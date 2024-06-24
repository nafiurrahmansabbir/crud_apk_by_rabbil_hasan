import 'package:flutter/material.dart';

AppBar customAppBar(text){
  return AppBar(
      title: Text(text,style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.green
  );
}