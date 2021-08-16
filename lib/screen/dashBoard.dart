import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trade/screen/login.dart';
import 'package:trade/screen/task/Tasklist.dart';

import 'package:trade/screen/videoPlayer/videos.dart';
import 'package:trade/screen/videoPlayer/uploadVidoes.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 52.0,
                  ),
                  Image.asset(
                    "assets/image.png",
                    width: 52.0,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Welcome to the Truth",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskList()));
                          },
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/todo.png",
                                    width: 64.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Tasks",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "2 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          )),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskList()));
                          },
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/note.png",
                                    width: 64.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Notes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "12 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          )),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => uploadVideos()));
                        },
                        child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/live-chat-icon-7413.png",
                                    width: 64.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Chats",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "4 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            ))),
                      ),
                    ),
                    SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => videos()));
                          },
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/video-play-icon.png",
                                    width: 64.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Videos",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
