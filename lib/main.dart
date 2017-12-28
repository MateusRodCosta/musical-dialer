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

  _buildDialerButton(String label, String altValue) {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(label),
      ],
    );

  }

  _buildDialer() {
    return new GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      children: <Widget>[
        _buildDialerButton('1', null),
        _buildDialerButton('2', "ABC"),
        _buildDialerButton('3', "DEF"),
        _buildDialerButton('4', "GHI"),
        _buildDialerButton('5', "JKL"),
        _buildDialerButton('6', "MNO"),
        _buildDialerButton('7', "PQRS"),
        _buildDialerButton('8', "TUV"),
        _buildDialerButton('9', "WXYZ"),
        _buildDialerButton('*', null),
        _buildDialerButton('0', "+"),
        _buildDialerButton('#', null),
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
          horizontal: 8.0,
          vertical: 16.0,
        ),
        alignment: AlignmentDirectional.bottomCenter,
        child: _buildDialer(),
      ),
    );
  }
}
