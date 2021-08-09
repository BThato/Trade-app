import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// class PlayVideoChewis extends StatefulWidget {
//   final String url;
  
//   PlayVideoChewis({required this.url});

//   @override
//   _PlayVideoChewisState createState() => _PlayVideoChewisState();
// }

// class _PlayVideoChewisState extends State<PlayVideoChewis> {
  
//   late final VideoPlayerController _videoPlayerController;

//   late final ChewieController _chewieController;

//   Future initilizeVideo() async {

//     print("This the Url :"+ widget.url);
//     _videoPlayerController = VideoPlayerController.network(widget.url);

//      _videoPlayerController.initialize();
    
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: true,
//       looping: true,
//     );
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     initilizeVideo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container( 
//       height: 250,
//       child: _chewieController != null &&
//               _chewieController.videoPlayerController.value.isInitialized
//           ? Chewie(controller: _chewieController)
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
// }

class VideoApp extends StatefulWidget {
  @override
  final  url;
  VideoApp({required this.url});
  
    
//   PlayVideoChewis({required this.url});
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    print( widget.url);
    super.initState();
    _controller = VideoPlayerController.network(
       widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });


      
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                  
                  
                )
              : Container(),
              
              
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ?
                   _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
