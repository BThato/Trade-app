import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trade/screen/login.dart';
import 'package:trade/screen/signup.dart';
import 'package:trade/screen/videos.dart';
import 'package:file_picker/file_picker.dart';

class uploadVideos extends StatelessWidget {

var videoUrl;
    choiceVideos() async{
            FilePickerResult? result = await FilePicker.platform.pickFiles();

          if(result != null) {
            PlatformFile file = result.files.first;
            
            print(file.name);
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
            setState((){ videoUrl= file.name;});

            print(videoUrl);
          } else {
            // User canceled the picker
          }
    }

  Future saveVideo() async{
    
    var url = Uri.parse("uri");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload and Play"),),

      body: Column(children: [
        Center(child: OutlineButton(onPressed: (){ choiceVideos(); },child: Text("Upload Vidoes"),)),
        SizedBox(height: 20,)
      ],),

    );
  }

  void setState(Null Function() param0) {}
}