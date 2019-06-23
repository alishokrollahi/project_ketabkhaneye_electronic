import 'package:flutter/material.dart';



class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name : Ali Shokrollahi \n \n \n'),
            Text('Student Id : 96111033206031'),
          ],
        ),
      ),
    );
  }
}
