import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

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

  _showToast(String msg, {int? duration, int? gravity}) {
    FlutterToastr.show(msg, context, duration: duration, gravity: gravity);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Toastr for non-blocking notifications'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    child: Text('Show Short Toastr'),
                    onPressed: () => _showToast("Show Short Toastr")),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    child: Text('Show Long Toastr'),
                    onPressed: () => _showToast("Show Long Toastr", duration: FlutterToastr.lengthLong)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    child: Text('Show Bottom Toastr'),
                    onPressed: () => _showToast("Show Bottom Toastr", gravity: FlutterToastr.bottom)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    child: Text('Show Center Toastr'),
                    onPressed: () => _showToast("Show Center Toastr", gravity: FlutterToastr.center)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    child: Text('Show Top Toastr'),
                    onPressed: () => _showToast(
                        "Show Top Toastr",
                        gravity: FlutterToastr.top)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}