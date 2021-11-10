import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:io' as io;
import 'dart:ui' as ui;

import 'package:image/image.dart';

class Classifier {
  Classifier();

  classifyImage(XFile pickedImage) async {
    var file = io.File(pickedImage.path);
    final imageTemp = decodeImage(file.readAsBytesSync());
    final resizedImg = copyResize(imageTemp!, height: 28, width: 28);
    final imgBytes = resizedImg.getBytes();
    final imgAsList = imgBytes.buffer.asUint8List();

    return getPrediction(imgAsList);
  }

  classifyDrawing(List<Offset> points) async {
    final picture = toPicture(points); // convert List to Picture
    final image = await picture.toImage(28, 28); // Picture to 28x28 Image
    ByteData? imgBytes = await image.toByteData(); // Read this image
    var imgAsList = imgBytes!.buffer.asUint8List();

    // Everything "important" is done in getPred
    return getPrediction(imgAsList);
  }

  Future<int> getPrediction(Uint8List imgAsList) async {
    List<double> resultBytes =
        List<double>.filled(28 * 28, 0.0, growable: false);

    int index = 0;
    for (var i = 0; i < imgAsList.lengthInBytes; i += 4) {
      final r = imgAsList[i];
      final g = imgAsList[i + 1];
      final b = imgAsList[i + 2];

      resultBytes[index] = ((r + g + b) / 3.0) / 255.0;
      index++;
    }

    var input = resultBytes.reshape([1, 28, 28, 1]);
    var output = List<int>.filled(10, 0, growable: false).reshape([1, 10]);

    // InterpreterOptions interpreterOptions = InterpreterOptions();

    try {
      Interpreter interpreter = await Interpreter.fromAsset(
        "model/model.tflite",
      );

      interpreter.run(input, output);
    } catch (e) {}

    double highestProb = 0;
    int digitPred = -1;

    for (var i = 0; i < output[0].length; i++) {
      if (output[0][i] > highestProb) {
        highestProb = output[0][i];
        digitPred = i;
      }
    }

    return digitPred;
  }

  ui.Picture toPicture(List<Offset> points) {
    // Obtain a Picture from a List of points
    // This Picture can then be converted to something
    // we can send to our model. Seems unnecessary to draw twice,
    // but couldn't find a way to record while using CustomPainter,
    // this is a future improvement to make.

    final _whitePaint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..strokeWidth = 16.0;

    final _bgPaint = Paint()..color = Colors.black;
    final _canvasCullRect =
        Rect.fromPoints(const Offset(0, 0), const Offset(28.0, 28.0));
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, _canvasCullRect)..scale(28 / 300);

    canvas.drawRect(Rect.fromLTWH(0, 0, 28, 28), _bgPaint);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != const Offset(-1, -1) &&
          points[i + 1] != const Offset(-1, -1)) {
        canvas.drawLine(points[i], points[i + 1], _whitePaint);
      }
    }

    return recorder.endRecording();
  }
}
