import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Toast plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show Short Toast'),
                    onPressed: () => showToast("Show Short Toast")),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show Long Toast'),
                    onPressed: () => showToast("Show Long Toast", duration: FlutterToastr.LENGTH_LONG)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show Bottom Toast'),
                    onPressed: () => showToast("Show Bottom Toast", gravity: FlutterToastr.BOTTOM)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show Center Toast'),
                    onPressed: () => showToast("Show Center Toast", gravity: FlutterToastr.CENTER)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    child: Text('Show Top Toast'),
                    onPressed: () => showToast(
                        "Ola",
                        gravity: FlutterToastr.TOP)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    FlutterToastr.show(msg, context, duration: duration, gravity: gravity);
  }
}