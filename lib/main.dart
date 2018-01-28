import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(new DialpadApp());

/*
AudioPlayer audioPlayer = new AudioPlayer();

Future<ByteData> loadAsset(String key) async {
  var fileName;
  switch(key) {
    case '*':
      fileName = "Star";
      break;
    case '#':
      fileName = "-";
      break;
    default:
      fileName = key;
      break;
  }
  return await rootBundle.load('sounds/Dtmf$fileName.ogg');
}

Future playLocal(String key) async {
  final file = new File('${(await getTemporaryDirectory()).path}/music.mp3');
  await file.writeAsBytes((await loadAsset(key)).buffer.asUint8List());
  final result = await audioPlayer.play(file.path, isLocal: true);
}

_playTone(String key) {
  audioPlayer.stop();
  playLocal(key);
}
*/

class DialpadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Musical Dialer',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Musical Dialer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class DialerButton extends StatelessWidget {
  final String label;
  final String altValue;

  DialerButton(this.label, this.altValue);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(onPressed: null, child: _buildButtonContent());
  }

  Widget _buildButtonContent() {
    if (this.altValue == null) {
      return new Text(this.label);
    } else {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(this.label),
          new Text(this.altValue),
        ],
      );
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  _buildDialer() {
    return new GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      children: <Widget>[
        new DialerButton('1', null),
        new DialerButton('2', "ABC"),
        new DialerButton('3', "DEF"),
        new DialerButton('4', "GHI"),
        new DialerButton('5', "JKL"),
        new DialerButton('6', "MNO"),
        new DialerButton('7', "PQRS"),
        new DialerButton('8', "TUV"),
        new DialerButton('9', "WXYZ"),
        new DialerButton('*', null),
        new DialerButton('0', "+"),
        new DialerButton('#', null),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        alignment: AlignmentDirectional.bottomCenter,
        child: _buildDialer(),
      ),
    );
  }
}
