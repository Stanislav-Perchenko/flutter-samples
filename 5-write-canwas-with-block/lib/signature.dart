import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;


import 'domain/remove_event.dart';
import 'domain/writer_bloc.dart';

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {

  List<Offset> _points = <Offset>[];
  WriterBloc bloc;



  void _decrementSetStateCallback() {
    print('Signature setState() - LAST');
    int idx = -1;
    if (_points.length > 2) {
      for (int i = _points.length - 2; i >= 0; i--) {
        if (_points[i] == null) {
          idx = i;
          break;
        }
      }
    }
    _points = (idx > 0) ? _points.sublist(0, idx+1) : List.empty();
  }



  Widget build(BuildContext context) {


    if(bloc == null) {
      bloc = provider.Provider.of<WriterBloc>(context);
      bloc.removeEventStream.listen((event) {
        print("Signature remove command - $event");
        switch(event) {

          case RemoveEvent.REMOVE_LAST:
            setState(_decrementSetStateCallback);

            break;
          case RemoveEvent.REMOVE_ALL:
            setState(() {
              print('Signature setState() - ALL');
              _points = List.empty();
            });
            break;
        }
      });
    }




    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        RenderBox referenceBox = context.findRenderObject();
        Offset localPosition = referenceBox.globalToLocal(details.globalPosition);

        setState(() {
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) {
        _points.add(null);
        bloc.addDrawing();
      },
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  final mPaint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], mPaint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}