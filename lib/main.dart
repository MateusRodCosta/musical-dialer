import 'package:flutter/material.dart';

void main() => runApp(new DialpadApp());

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

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new Column(
              children: <Widget>[
                new Row(children: <Widget>[
                  new Text('1'),
                  new Text('2'),
                  new Text('3'),
                ]),
                new Row(children: <Widget>[
                  new Text('4'),
                  new Text('5'),
                  new Text('6'),
                ]),
                new Row(children: <Widget>[
                  new Text('7'),
                  new Text('8'),
                  new Text('9'),
                ]),
                new Row(children: <Widget>[
                  new Text('*'),
                  new Text('0'),
                  new Text('#'),
                ]),
              ],
            )
        )
    );
  }
}
