import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/about_page.dart';
import './about_page.dart';
import './books.dart';
import './signin_page.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final _controller_key = TextEditingController();
  final _controller_data = TextEditingController();
  String text_to_show = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Library Design'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => about()));
                },
              )
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(children: <Widget>[
                FlutterLogo(
                  size: 140,
                  colors: Colors.purple,
                  style: FlutterLogoStyle.horizontal,
                )
              ]),
              Column(children: <Widget>[
                TextField(
                  controller: _controller_key,
                  decoration: InputDecoration(hintText: 'Enter Your Username'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                TextField(
                  controller: _controller_data,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                  ),
                  obscureText: true,
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 18),
              ),
              Column(children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () => readdata(_controller_key.text),
                  child: Text('Login'),
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signin())),
                  child: Text('SignIn'),
                ),
              ]),
            ],
          ),
        ));
  }

  readdata(String text) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      text_to_show = 'Welcome!';
      password = prefs.getString(text);
      String textfield2_content = _controller_data.text;
      if (password == textfield2_content)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => book(value: _controller_key.text,)));
      else
        Fluttertoast.showToast(
            msg: 'Username And Password Not Matched ...',
            toastLength: Toast.LENGTH_LONG);
    });
  }
}