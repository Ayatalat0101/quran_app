
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
class PlayAudio extends StatefulWidget {
  const PlayAudio({Key? key, required this.ayaAduioNum}) : super(key: key);
  final int ayaAduioNum;
  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  final audioPlayer =AudioPlayer();
  bool isPlaying = false;
 late String num;
  @override
  void initState() {
    super.initState();
    if(widget.ayaAduioNum<10){
       num="00${widget.ayaAduioNum+1}";
    } else if(widget.ayaAduioNum<=10||widget.ayaAduioNum>100){
      num="0${widget.ayaAduioNum+1}";
    }else{num=widget.ayaAduioNum.toString();}
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSourceUrl('https://download.quranicaudio.com/quran/abdullaah_alee_jaabir_studio/$num.mp3');
    audioPlayer.onPlayerStateChanged.listen((State)
    {
      setState((){
        isPlaying =State==PlayerState.playing;
      });

    }
    );
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:kMainColor,
            radius: 30,
      child:IconButton(
        onPressed: ()async {
          if (isPlaying){
            await audioPlayer.pause();
          }else {
          await audioPlayer.play(UrlSource('https://download.quranicaudio.com/quran/abdullaah_alee_jaabir_studio/$num.mp3'));

          }
        },
        icon: isPlaying?Icon(Icons.pause):Icon(Icons.play_arrow),
        iconSize:40,
        color:   Color(0xff047285),
      ),
    );
  }
 
}
