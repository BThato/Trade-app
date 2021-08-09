import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {

  VideoPlayerController videoPlayerController;

   bool looping;

  VideoList({required this.videoPlayerController,required this.looping});

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {

  late ChewieController chewieController;

  @override
  void initState(){
    super.initState();

    chewieController =ChewieController(
      videoPlayerController:widget.videoPlayerController,
      looping: widget.looping,
      autoPlay: false,
      aspectRatio: 3/2,
      errorBuilder: (context,errorMsg){
         return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}