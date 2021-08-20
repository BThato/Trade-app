import 'dart:convert';
import 'package:flutter/material.dart';
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
              if (snapshot.hasError || snapshot == Null)
                return Center(child: Text("Please connect to the Internet"));
              else
                // new code
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(
                                            width: 1.0,
                                            color: Colors.white24))),
                                child:
                                    Icon(Icons.autorenew, color: Colors.white),
                              ),
                              title: Text(
                                "${snapshot.data[index]['video_url']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                              subtitle: Row(
                                children: <Widget>[
                                  Icon(Icons.linear_scale,
                                      color: Colors.yellowAccent),
                                  Text(DateTime.now().toString(),
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Taskuploads(
                                              url:
                                                  "${snapshot.data[index]['video_url']}",
                                            )));
                              },
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white, size: 30.0))),
                    );
                  },
                );

            //
            //
            //
            // ListView.builder(
            //     itemCount: snapshot.data.length,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) => Container(
            //           color: Colors.white10,
            //           width: MediaQuery.of(context).size.width,
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 10.0, vertical: 5.0),
            //           child: Card(
            //             elevation: 5.0,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(0.0),
            //             ),
            //             child: Container(
            //               width: MediaQuery.of(context).size.width,
            //               padding: EdgeInsets.symmetric(
            //                   horizontal: 10.0, vertical: 10.0),
            //               child: Row(
            //                 mainAxisAlignment:
            //                     MainAxisAlignment.spaceBetween,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Row(
            //                     crossAxisAlignment:
            //                         CrossAxisAlignment.start,
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     children: <Widget>[
            //                       Container(
            //                         width: 55.0,
            //                         height: 55.0,
            //                         color: Colors.black,
            //                         child: CircleAvatar(
            //                           backgroundColor: Colors.black,
            //                           foregroundColor: Colors.black,
            //                           backgroundImage:
            //                               AssetImage("assets/todo.png"),
            //                         ),
            //                       ),
            //                       SizedBox(width: 5.0),
            //                       Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: <Widget>[
            //                           Text(
            //                             "The snap belongs Here",
            //                             style: TextStyle(fontSize: 18),
            //                           )
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                   Container(
            //                     alignment: Alignment.center,
            //                     padding: EdgeInsets.symmetric(
            //                         horizontal: 10.0, vertical: 5.0),
            //                     child: FlatButton(
            //                       onPressed: () {
            //                         Navigator.push(
            //                             context,
            //                             MaterialPageRoute(
            //                                 builder: (context) =>
            //                                     Taskuploads()));
            //                       },
            //                       color: Colors.red[200],
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius:
            //                               BorderRadius.circular(20.0)),
            //                       child: Text("Tap here"),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ));

            //////////
            ///
            ///
          }
        },
      ),
    );
  }
}
