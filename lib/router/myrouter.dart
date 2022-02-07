
import 'package:flutter/material.dart';
import 'package:imtihonthird/screens/home_page.dart';
import 'package:imtihonthird/screens/qazolar/qazolar.dart';
import 'package:imtihonthird/screens/qiblah/basic.dart';
import 'package:imtihonthird/screens/quron/quranSuras.dart';
import 'package:imtihonthird/screens/taqvim/taqvim.dart';
import 'package:imtihonthird/screens/tasbeh/tasbeh_page.dart';

class RouterGenerator {
  
  
  static onGenerateRoute(RouteSettings settings) {
    
    
    switch (settings.name) {
      
      
      case "/":
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case "/tasbeh_page":
        return MaterialPageRoute(builder: (context) => TasbehPage());
      case "/quron":
        return MaterialPageRoute(builder: (context) => QuranSuras());
      case "/taqvim":
        return MaterialPageRoute(builder: (context) => Taqvim());
      case "/compass":
        return MaterialPageRoute(builder: (context) => MyApp());

      case "/qazahs":
        return MaterialPageRoute(builder: (context) => QazolarPage());








      default:
    }
  }
}
