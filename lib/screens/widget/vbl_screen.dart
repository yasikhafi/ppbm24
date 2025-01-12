import 'package:demo/screens/core/constant/colors.dart';
import 'package:demo/screens/core/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoBased extends StatefulWidget {
  static const String routeName = 'VideoBased';
  const VideoBased({super.key});

  @override
  State<VideoBased> createState() => _VideoBasedState();
}

class _VideoBasedState extends State<VideoBased> {
  late YoutubePlayerController _controller;
  Video? _selectedVideo;

  final List<Video> videos = [
    Video(id: 'tJGTWw_YcCM', title: 'Video 1'),
    Video(id: '9i64Oh5auU0', title: 'Video 2'),
    // Tambahkan video lainnya di sini
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void _playVideo(Video video) {
    setState(() {
      _selectedVideo = video;
      _controller.load(video.id);
    });
  }

  void _stopVideo() {
    _controller.pause();
    _controller.seekTo(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //create icon back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .45,
            decoration: const BoxDecoration(
              color: secondaryColor,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/quil.png',
                ),
                fit: BoxFit.none,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  sizedBox,
                  Text(
                    "Video Based Learning",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: textColorBlack,
                        fontSize: 50,
                        fontWeight: FontWeight.w900),
                  ),
                  sizedBox,
                  if (_selectedVideo != null)
                    Column(
                      children: [
                        YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {
                                _controller.play();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.pause),
                              onPressed: () {
                                _controller.pause();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.stop),
                              onPressed: () {
                                _stopVideo();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        final video = videos[index];
                        final thumbnailUrl =
                            'https://img.youtube.com/vi/${video.id}/0.jpg';
                        return GestureDetector(
                          onTap: () => _playVideo(video),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(thumbnailUrl),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(
                                      0.5), // Overlay hitam semi-transparan
                                  BlendMode.darken,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_circle_outline,
                                      size: 50.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    video.title,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Video {
  final String id;
  final String title;

  Video({required this.id, required this.title});
}
