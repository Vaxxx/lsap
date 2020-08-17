import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sapientia/utilities/constants.dart';

class RadioPlayer extends StatefulWidget {
  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  @override
  void initState() {
    playRadio();
    super.initState();
  }

  playRadio() async {
    int result = await _audioPlayer.play(listenLiveUrl);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listen Live'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Listen Live',
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              color: Colors.black,
              onPressed: () {
                if (isPlaying) {
                  _audioPlayer.pause();

                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  _audioPlayer.resume();

                  setState(() {
                    isPlaying = true;
                  });
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              color: Colors.black,
              onPressed: () {
                _audioPlayer.stop();

                setState(() {
                  isPlaying = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
