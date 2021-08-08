import 'dart:convert';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trade/screen/login.dart';
import 'package:trade/screen/playvideochewie.dart';
import 'package:trade/screen/signup.dart';
import 'package:http/http.dart' as http;
import 'package:trade/screen/config.dart';
import 'package:chewie/chewie.dart';

class videos extends StatelessWidget {
  getData() async {
    
    final url = Uri.parse(
        "http://192.168.8.102/upload_video_toutorial/fatchvidoes.php");

    var response = await http.get(url);

   
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect To Mysql Server'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List snap = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error fecthing Data"),
            );
          }
          return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>VideoApp(
                          url:
                              "http://192.168.8.102/upload_video_toutorial/video/" +
                                  "${snap[index]['video_url']}",
                        ),
                      ),
                    );
                  },
                  title: Text("Head: ${snap[index]['video_name']}"),
                  subtitle: Text("${snap[index]['video_url']}"),
                );
              });
        },
      ),
    );
  }
}
