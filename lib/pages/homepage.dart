// import 'dart:js';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:music_player/components/my_drawer.dart';
// import 'package:music_player/models/playlist_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../models/songs.dart';
// import 'SongPage.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late final dynamic playlistProvider;
//
//   @override
//   void initState(){
//
//     super.initState();
//     // get playlistprovider
//     playlistProvider= Provider.of<PlayListProvider>(context, listen: false);
//
//   }
//   void goToSong(int songIndex){
//     //update current song index
//     playlistProvider.currentSongIndex = songIndex;
//
//     Navigator.push(context, MaterialPageRoute(builder: (context)=> SongPage(),
//     ),);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.only(left: 50),
//
//             child: Text("P L A Y L I S T ",
//             style: TextStyle(
//               //fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           ),
//         )),
//         drawer: const MyDrawer(),
//        body: Consumer<PlayListProvider>(
//          builder: (context, value, child){
//            // get the playlist
//            final List<Song> playlist = value.playList;
//             return ListView.builder(
//               itemCount: playlist.length,
//                 itemBuilder: (context, index) {
//                     final Song song = playlist[index];
//                  return ListTile(
//                    title: Text(song.songName),
//                    subtitle: Text(song.artistName),
//                    leading: Image.asset(song.albumArtImagePath),
//                    onTap: () => goToSong(index),
//                  );
//                 }
//              );
//             }
//             ),
//        );
//
//   }
// }
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

import 'package:music_player/models/songs.dart';
import 'SongPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PlayListProvider playlistProvider;

  @override
  void initState() {
    super.initState();
  }

  void goToSong(int songIndex) {
    //update current song index
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "P L A Y L I S T ",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlayListProvider>(
        builder: (context, value, child) {
          // get the playlist
          final List<Song> playlist = value.playList;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: SizedBox(
                  width: 80, // Adjust the width as needed
                  child: Image.asset(song.albumArtImagePath),
                ),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
