import 'package:flutter/material.dart';
import 'package:ringtone_manager/ringtone_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Play"),
              onPressed: play,),
            RaisedButton(
              child: Text("Stop"),
              onPressed: stop,),
          ],
        ),
      ),
    );
  }

  void play() async {
    await RingtoneManager.play;
  }

  void stop() async {
    await RingtoneManager.stop;
  }
}
