import 'package:flutter/material.dart';

Color colorTag(String tag ){
  debugPrint(tag);
  switch(tag){
    case 'Universidad':
      return Colors.black;
    case 'Trabajo':
      return Colors.orangeAccent;
    case 'Estudio':
      return Colors.blue;
    default:
      return Colors.green;
  }
}