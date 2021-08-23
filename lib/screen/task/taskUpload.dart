import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:trade/screen/config.dart';
import 'package:http/http.dart' as http;
import 'package:trade/screen/login.dart';

// ignore: must_be_immutable
class Taskuploads extends StatelessWidget {
  var videoUrl;
  var numberList;
  @override
  final url;
  Taskuploads({required this.url});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: Column(
        children: [
          Container(
            child: Hero(
              tag: "times",
              child: Image.asset(
                "assets/todo.png",
                width: 64.0,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "article.title",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(5.0),
                  child: Text(
                    "article.publishedAt",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: Text(
                    "Identify a peak formation high and a peak formation low. Then identify all" +
                        "the features of the 3 tiered cycle within both on a 3 day and an intraday" +
                        "cycle." +
                        "Understand that they will not all looked perfect but nonetheless there are"
                            "variations on the theme and being able to identify the variations is" +
                        "fundamentally important.",
                    style: TextStyle(
                      color: Colors.grey[800],
                      //fontWeight: FontWeight,
                      fontSize: 17,
                    ),
                  ),
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        onPressed: () {
                          // Respond to button press
                          choiceVideos();
                        },
                        child: Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        onPressed: () {
                          // Respond to button press
                          saveVideo();
                        },
                        child: Icon(Icons.save),
                      ),
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
