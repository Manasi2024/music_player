import 'package:flutter/material.dart';
import 'package:music_player/pages/homepage.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'models/playlist_provider.dart';

void main() {
      runApp(MultiProvider(providers: [
              ChangeNotifierProvider(create : (context)=> ThemeProvider()),
              ChangeNotifierProvider(create : (context)=> PlayListProvider())
              //ChangeNotifierProvider(create : (context)=> ThemeProvider(),

            ],
          child: const MyApp(),
          )
      );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

