import 'package:cruid_app_ii_by_rabbil_hasan/Screen/ProductGridViewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD App',
      // home: ProductcreatScreen(),
      home: ProductGrideViewScreen(),
    );
  }
}
