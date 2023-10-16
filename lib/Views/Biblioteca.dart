import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({Key? key}) : super(key: key);

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  String img_cover_url =
      "https://i.pinimg.com/736x/a7/a9/cb/a7a9cbcefc58f5b677d8c480cf4ddc5d.jpg";

  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;
  List<String> songs = [
    "FinDeSemana.mp3",
    "SERPIENTE.mp3",
    "PIÉNSALO.mp3",
    "Maluma.mp3",
    "Loco.mp3",
    "Frontera.mp3",
    "Frontera.mp3",
    "farzante.mp3",
    "Bella.mp3",
    "bebo.mp3",
    "BailaSola.mp3",
    // Agrega más canciones aquí
  ];
  int currentSongIndex = 0;

  void initPlayer() async {
    await player.setSource(AssetSource("${songs[currentSongIndex]}"));
    duration = await player.getDuration();
    setState(() {
      isPlaying = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void playNextSong() async {
    if (currentSongIndex < songs.length - 1) {
      currentSongIndex++;
    } else {
      currentSongIndex = 0;
    }
    await player.setSource(AssetSource("${songs[currentSongIndex]}"));
    setState(() {
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img_cover_url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.0),
              Image.network(
                img_cover_url,
                width: 250.0,
              ),
              SizedBox(height: 10.0),
              Text(
                "Playlist",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.resume();
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      playNextSong();
                    },
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
