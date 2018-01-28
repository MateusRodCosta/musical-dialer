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
  final IconData icon;

  DialerButton(this.label, this.altValue, this.icon);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      onPressed: null,
      child: new Container(
        height: 64.0,
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildSecondRowButton() {
    if(this.icon != null) {
      return new Icon(icon);
    } else {
      return new Text(this.altValue);
    }
  }

  Widget _buildButtonContent() {
    if (this.altValue == null && this.icon == null) {
      return new Center(
        child: new Text(this.label),
      );
    } else {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(this.label),
          _buildSecondRowButton(),
        ],
      );
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  _buildDialer() {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Expanded(
              child: new DialerButton('1', null, Icons.voicemail),
            ),
            new Expanded(
              child: new DialerButton('2', "ABC", null),
            ),
            new Expanded(
              child: new DialerButton('3', "DEF", null),
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new DialerButton('4', "GHI", null),
            ),
            new Expanded(
              child: new DialerButton('5', "JKL", null),
            ),
            new Expanded(
              child: new DialerButton('6', "MNO", null),
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new DialerButton('7', "PQRS", null),
            ),
            new Expanded(
              child: new DialerButton('8', "TUV", null),
            ),
            new Expanded(
              child: new DialerButton('9', "WXYZ", null),
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new DialerButton('*', null, null),
            ),
            new Expanded(
              child: new DialerButton('0', "+", null),
            ),
            new Expanded(
              child: new DialerButton('#', null, null),
            ),
          ],
        ),
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
