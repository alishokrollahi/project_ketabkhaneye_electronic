import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './books.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final _controller_key = TextEditingController();
  final _controller_data = TextEditingController();
  final _controller_Email = TextEditingController();
  final _controller_age = TextEditingController();

  String text_to_show = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SingIn'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller_key,
                decoration: InputDecoration(hintText: 'Enter Your Name'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TextField(
                controller: _controller_data,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                ),
                obscureText: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TextField(
                controller: _controller_Email,
                decoration: InputDecoration(hintText: 'Enter Your Email  (optional)'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter Your Age  (optional)'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              RaisedButton(
                color: Colors.purpleAccent,
                textColor: Colors.white,
                onPressed: () =>
                    savedata(_controller_key.text, _controller_data.text),
                child: Text('Create Account!'),
              ),
              Text('$text_to_show')
            ]),
      ),
    );
  }

  savedata(String key, String value) async {
    if(_controller_key.text != '' && _controller_data.text != ''){
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    Fluttertoast.showToast(
        msg: 'Account Created!', toastLength: Toast.LENGTH_LONG);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => book(value: _controller_key.text,)));
  }
  else
    Fluttertoast.showToast(
        msg: 'Please Complete Your Informations ...' , toastLength: Toast.LENGTH_LONG);
  }
}
