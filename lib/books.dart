import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import './page1.dart';
import 'dart:async' as async;

class book extends StatefulWidget {

  final String value;
  book({Key  key , this.value}) : super (key: key);

  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<book> {
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    var url = 'https://api.myjson.com/bins/jb58f';
    http.Response response = await http.get(url);
    setState(() {
      data = convert.jsonDecode(response.body);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Current User : ' , style: TextStyle(fontSize: 18.5),),
              Text(widget.value , style: TextStyle(color: Colors.tealAccent , fontSize: 18.5 , fontStyle: FontStyle.italic),)
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.person , color: Colors.white,),
          ),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Card(
                          elevation: 2,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                child: Text(
                                  data[index]["bookname"] + '\n',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                padding: EdgeInsets.only(top: 4),
                              ),
                              //Text(data[index]["bookurl"]),
                              Padding(
                                child: Linkify(
                                  onOpen: (link) async {
                                    if (await canLaunch(link.url)) {
                                      await launch(link.url);
                                    } else {
                                      throw 'Could not launch $link';
                                    }
                                  },
                                  text: data[index]["bookurl"],
                                  //style: TextStyle(color: Colors.yellow),
                                  linkStyle:
                                      TextStyle(color: Colors.purpleAccent),
                                ),
                                padding: EdgeInsets.only(bottom: 4),
                              )
                            ],
                          ))
                    ],
                  );
                })));
  }
}
