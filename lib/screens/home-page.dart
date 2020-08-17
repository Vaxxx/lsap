import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapientia/mainScreens/bookmark-page.dart';
import 'package:sapientia/mainScreens/search-page.dart';
import 'package:sapientia/mainScreens/settings-page.dart';
import 'package:sapientia/screens/headlines.dart';
import 'package:sapientia/utilities/constants.dart';
import 'package:sapientia/widgets/nav-drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  PageController pageController;
  int pageIndex = 0;

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  void onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

  @override
  void initState() {
    playRadio();
    pageController = PageController();
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
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Headlines'),
        backgroundColor: googleColor,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Listen Live'),
              IconButton(
                icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                color: colorDeepBlue,
                onPressed: () {
                  if (isPlaying) {
                    _audioPlayer.stop();

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
              )
            ],
          )
        ],
      ),
      body: PageView(
        children: [
          Headlines(),
          Search(),
          Bookmark(),
          Settings(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
            icon: Icon(Icons.home),
            color: googleColor,
            onPressed: () {
              print('I am being pressed');
            },
          )),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
