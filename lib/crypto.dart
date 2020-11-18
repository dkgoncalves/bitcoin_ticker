import 'package:flutter/material.dart';

class Crypto {
  String selectedPicker;
  String text;
  String rate;

  Crypto({this.text,  this.rate, this.selectedPicker});

  Widget cryptoCard(){
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $text = ${rate != null ? rate : '?'} $selectedPicker',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}