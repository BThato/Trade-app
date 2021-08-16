import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trade/screen/videoPlayer/playvideochewie.dart';

import 'package:http/http.dart' as http;
import 'package:trade/screen/config.dart';
import 'package:trade/screen/task/taskUpload.dart';

// ignore: camel_case_types
class TaskList extends StatelessWidget {
  getData() async {
    final url = Uri.parse(Config.FETCHDATA_URL);

    var response = await http.get(url);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task to be completed'),
      ),
      body: FutureBuilder(
        future: getData(), // async work
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError)
                return Center(child: Text("Please connect to the Internet"));
              else
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Taskuploads(),
                            ),
                          );
                        },
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Head: ${snapshot.data[index]['video_name']}"),
                        ),
                      );
                    });

            //////////
            ///
            ///
          }
        },
      ),
    );
  }
}
