import 'package:flutter/material.dart';

class AppLayout{
  static dynamic _size ;
  static getSize(BuildContext context){
     _size = MediaQuery.of(context).size;
     return _size;
  }

  static getScreenHeight()
  {
    return _size.height;
  }

  static getScreenWidth()
  {
    return _size.width;
  }

  static getHeight(double pixels )
  {
    double x = getScreenHeight()/pixels;
    return getScreenHeight()/x; 
  }


  static getWidth(double pixels )
  {
    double x = getScreenWidth()/pixels;
    return getScreenWidth()/x; 
  }


}