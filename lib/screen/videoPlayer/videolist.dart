import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

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
    Wakelock.enable();

    chewieController =ChewieController(
      videoPlayerController:widget.videoPlayerController,
      looping: widget.looping,
      autoInitialize: true,
      aspectRatio: 3/2,
      allowedScreenSleep: true,
      showControls: true,
      errorBuilder: (context,errorMsg){
         return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Chewie(controller: chewieController,),
      
    );
  }


  @override
  void dispose() {

   
    // TODO: implement dispose
    super.dispose();
     chewieController.dispose();
  }
}