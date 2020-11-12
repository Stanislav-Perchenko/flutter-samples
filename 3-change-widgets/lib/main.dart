import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getChildByToggle() => toggle
      ? Text('Toggle one')
      : ElevatedButton(onPressed: () {}, child: Text('Toggle two'));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Change Widgets sample'),
    ),
    body: Center(
      child: _getChildByToggle(),
    ),
    floatingActionButton: FloatingActionButton(
      tooltip: 'Update widget',
      child: Icon(Icons.update),
      onPressed: _toggle,
    ),
  );
}
