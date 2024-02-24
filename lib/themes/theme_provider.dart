
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/themes/light_mode.dart';

import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier{

// primarily lightmode

ThemeData _themeData = lightMode;
// to get theme
ThemeData get themeData => _themeData;

//  dark mode
bool get isDarkMode => _themeData == darkMode;
// set theme
set themeData(ThemeData themeData){

  _themeData= themeData;


  // ui update
  notifyListeners();
}
// toggle theme
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData=darkMode;
      }else{
      themeData=lightMode;
      }
    }
}