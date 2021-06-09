import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/config_page.dart';
import 'package:straussweb/src/pages/help_page.dart';
import 'package:straussweb/src/pages/home_page.dart';
import 'package:straussweb/src/pages/login_page.dart';
import 'package:straussweb/src/pages/navegacion_page.dart';
import 'package:straussweb/src/pages/register_page.dart';



Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
 "login" : (BuildContext context) => LoginPage(),
 "register":  (BuildContext context) => RegisterPage(),
  "help":  (BuildContext context) => HelpPage(),
 "config":  (BuildContext context) => ConfigPage(),
 "navegacion":  (BuildContext context) => NavegacionPage(),
 "home":  (BuildContext context) => HomePage(),
  };
}

