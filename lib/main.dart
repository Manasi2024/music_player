//
// import 'dart:async'; //timer
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
//
// import 'main_1.dart';
//
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//
//   //   // Asynchronous operations, e.g., initializing plugins
// //   await Firebase.initializeApp();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/': (BuildContext context) => const load(),
//         '/home': (BuildContext context) => const MyApp(),
//       },
//     ),
//   );
// }
//
// // ignore: camel_case_types
// class load extends StatefulWidget {
//   const load({super.key});
//
//   @override
//   State<load> createState() {
//     return _loadState();
//   }
// }
//
// // ignore: camel_case_types
// class _loadState extends State<load> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         const Duration(seconds: 8),
//             () => Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => const MyApp())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 150.0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 300,
//                   height: 300,
//                   child: Lottie.network(
//                       'https://lottie.host/f6fd7691-95a2-4bf8-b8d4-ec205af03e1c/4jCtJWzVss.json'),
//                 ),
//                 Text(
//                   ' Expensely',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 22 ,
//                     fontWeight: FontWeight.bold,
//
//                     //letterSpacing: 8.0,
//                     wordSpacing: 7.0,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(
//                     height: 3),
//                 Text(
//                   ' Track Your Expenses',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize:  16,
//                     fontWeight: FontWeight.normal,
//
//                     //letterSpacing: 8.0,
//                     wordSpacing: 7.0,
//                     color: Colors.amber,
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import 'package:music_player/pages/homepage.dart';
import 'package:music_player/themes/light_mode.dart';
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


