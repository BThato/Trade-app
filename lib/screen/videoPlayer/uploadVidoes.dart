import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trade/screen/login.dart';
import 'package:trade/screen/signup.dart';
import 'package:trade/screen/videoPlayer/videos.dart';
import 'package:file_picker/file_picker.dart';
import 'package:trade/screen/config.dart';
import 'package:http/http.dart' as http;

class uploadVideos extends StatelessWidget {
  var videoUrl;
  choiceVideos() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      videoUrl = file.path;

      print("url " + videoUrl);
    } else {
      // User canceled the picker
    }
  }

  Future saveVideo() async {
    final url = Uri.parse(Config.SAVE_URL);
    var request = http.MultipartRequest("POST", url);
    var uploadVideos = await http.MultipartFile.fromPath("my_Video", videoUrl);
    request.files.add(uploadVideos);
    var response = await request.send();

    if (response.statusCode == 200) {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload and Play"),
      ),
      body: Column(
        children: [
          Center(
              child: OutlineButton(
            onPressed: () {
              choiceVideos();
            },
            child: Text("Upload Vidoes"),
          )),
          SizedBox(
            height: 20,
          ),
          Text(videoUrl != null ? videoUrl : "Select videos"),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              saveVideo();
            },
            child: Text("Save Video"),
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
