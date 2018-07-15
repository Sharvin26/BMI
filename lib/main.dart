import 'package:flutter/material.dart';
import './ui/home.dart';

void main(){
  runApp(
    new MaterialApp(
      title: "BMICalc",
      home: new Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}