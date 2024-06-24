import 'package:flutter/cupertino.dart';

SliverGridDelegateWithFixedCrossAxisCount ProducGridViewStyle(){

  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    mainAxisExtent: 250,


  );
}