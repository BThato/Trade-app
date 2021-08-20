import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:trade/screen/config.dart';
import 'package:http/http.dart' as http;

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
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Upload The Task Completed task"),
  //     ),
  //     body: Column(
  //       children: [
  //         Center(
  //             child: OutlineButton(
  //           onPressed: () {
  //             choiceVideos();
  //           },
  //           child: Text("Upload Your Task Here"),
  //         )),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Text(videoUrl != null ? videoUrl : "Select videos"),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         MaterialButton(
  //           color: Colors.green,
  //           onPressed: () {
  //             saveVideo();
  //           },
  //           child: Text("task Saved"),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.more_vert,
                      size: 40,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          this.url,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      this.url,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/todo.png",
                          height: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " articles to read on t To answer thatThis page shares my best articles to read on t To answer that This page shares my best articles to read on t To answer that This page shares my best articles to read on t To answer thatThis page shares my best articles to read on t To answer that This page shares my best articles to read on t To answer that question, I like to write about science-based ways to solve practical problems.You’ll find interesting articles to read on topics like how to stop procrastinating as well as personal recommendations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
