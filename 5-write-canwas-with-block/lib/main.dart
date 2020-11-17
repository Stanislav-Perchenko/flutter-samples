import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

import 'domain/writer_bloc.dart';
import 'signature.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String  _appTitle = 'Canvas drawing';

  WriterBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return provider.ChangeNotifierProvider<WriterBloc>(
      create: (context) => (_bloc = WriterBloc()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(_appTitle),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.dispose();
  }
}



class HomePage extends StatelessWidget {
  final String _title;

  HomePage(this._title);

  @override
  Widget build(BuildContext context) {
    final block = provider.Provider.of<WriterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Center(
                child: Stack(
                  children: <Widget>[
                    Icon(
                        Icons.brightness_1,
                        size: 20,
                        color: Colors.red[700]
                    ),
                    Positioned(
                        top: 2.5,
                        right: 6,
                        child: Center(
                            child: Text(
                                '${block.numDrawings}',
                                style: new TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500)
                            )
                        )
                    )
                  ],
                )
            ),
          )
        ],
      ),
      body: Signature(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            tooltip: 'Clear all',
            child: Icon(Icons.clear),
            disabledElevation: 0,
            onPressed: block.isHasDrawing ? () {
              block.clearCanvas();
            } : null,
          ),
          FloatingActionButton(
            tooltip: 'Remove last',
            child: Icon(Icons.exposure_minus_1),
            disabledElevation: 0,
            onPressed: block.isHasDrawing ? () {
              block.removeLastDrawing();
            } : null,
          )
        ],
      ),
    );
  }
}





