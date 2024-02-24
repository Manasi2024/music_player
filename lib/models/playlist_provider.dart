import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player/models/songs.dart';

class PlayListProvider extends ChangeNotifier{
  // playlist of songs

  final List<Song> _playlist =[
  // song 1
    Song(songName: "Demon girl",
        artistName: "ABC",
        albumArtImagePath: "assets/images/pretty_girl.png",
        audioPath: "assets/audios/demon-girl.mp3"),
    
    // song 2
    Song(songName: "Waterfall",
        artistName: "Lina",
        albumArtImagePath: "assets/images/waterfall.png",
        audioPath: "assets/audios/waterfall.mp3"),

    // song 3

    Song(songName: "The Pricess",
        artistName: "Ana",
        albumArtImagePath: "assets/images/princess.png",
        audioPath: "assets/audios/the-princess.mp3")
  ];

  // current song playing index
  int? _currentSongIndex ;
  /*  AUDIOPLAYER  */

      //autio player
  final AudioPlayer _audioPlayer  = AudioPlayer();

      // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;


      // constructor
      PlayListProvider(){
             listenToDuration();
      }
      // initially not playing
      bool _isPlaying =false;

      //play the song
     void play() async{

       final String path = _playlist[_currentSongIndex!].audioPath;
       await _audioPlayer.stop();                    // stop the current song
       await _audioPlayer.play(AssetSource(path));  // play the new song
       _isPlaying=true;
       notifyListeners();
     }
      //pause the current song

      void pause() async{
        await _audioPlayer.pause();                    // stop the current song
        _isPlaying=false;
        notifyListeners();
      }
      // resume song
      void resume() async{
        await _audioPlayer.resume();                    // stop the current song
        _isPlaying=true;
        notifyListeners();
      }

      //pause & resume
      void pauseOrresume() async{

        if(_isPlaying){
          pause();
        }else{
          resume();
        }
        notifyListeners();
      }

      // seek to specific positons in current song
       void seek(Duration position) async{
       await _audioPlayer.seek(position);
        }
      // play next song
      void playNextSong() async{
       if(_currentSongIndex != null){
         if(_currentSongIndex! < _playlist.length - 1){
           // go to next song it is not last song
           currentSongIndex = _currentSongIndex! + 1;
         }else{
           // if it is the last song loop back to first song
           currentSongIndex=0;
         }
       }
      }
      // play previous song
      void playPreviousSong() async{
       // if more than 2 secs , then restart current song
        if(_currentDuration.inSeconds > 2){
            seek(Duration.zero);
            // go to next song it is not last song
            currentSongIndex = _currentSongIndex! + 1;
          }
        else{// if it is within first 2 secs then go to previous song
            // if it is the last song loop back to first son  g
            if(_currentSongIndex! > 0) {
              currentSongIndex = _currentSongIndex! - 1;
            }else{//if it is first song , loop back to last song
              currentSongIndex=  _playlist.length - 1;
            }
          }

      }



    // listen to duration
    void listenToDuration(){
    // listen for  total duration

      _audioPlayer.onDurationChanged.listen((newDuration) {
        _totalDuration=newDuration;
        notifyListeners();
      });
      // listen for total current duration

      _audioPlayer.onPositionChanged.listen((newPosition) {
        _currentDuration=newPosition;
        notifyListeners();
      });
      // listen for complete song
      _audioPlayer.onPlayerComplete.listen((event) {
        playNextSong();
      });
    }

    // dispose audio player




  /* get
 */


 List<Song> get playList => _playlist;
 int? get currentSongIndex => _currentSongIndex;
 bool get isPlaying => _isPlaying;
 Duration get currentDuration => _currentDuration;
 Duration get totalDuration => _totalDuration;



  /*set*/


  set currentSongIndex(int? newIndex){
    _currentSongIndex = newIndex;

    if(newIndex != null){
      play();             // play the song at the new index
    }
    //
    notifyListeners();
  }
}