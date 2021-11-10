import 'package:flutter/material.dart';
import 'package:hello_mnist2/dl_model/classifier.dart';

class DrawPage extends StatefulWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  Classifier classifier = Classifier();
  var points = <Offset>[];
  int digit = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        tooltip: "clear",
        child: const Icon(Icons.close),
        onPressed: () {
          points.clear();
          digit = -1;
          setState(() {});
        },
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Draw digit inside the box",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 300 + 4.0,
              width: 300 + 4.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails details) {
                  Offset localPosition = details.localPosition;
                  setState(
                    () {
                      if (localPosition.dx > 0 &&
                          localPosition.dx < 300 &&
                          localPosition.dy > 0 &&
                          localPosition.dy < 300) {
                        points.add(localPosition);
                      }
                    },
                  );
                },
                onPanEnd: (DragEndDetails details) async {
                  points.add(const Offset(-1, -1));
                  digit = await classifier.classifyDrawing(points);

                  setState(() {});
                },
                child: CustomPaint(
                  painter: Painter(points: points),
                  willChange: true,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              "Current Prediction:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              digit == -1 ? " " : "$digit",
              style: const TextStyle(
                  fontSize: 50,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final List<Offset> points;
  Painter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    try {
      for (var i = 0; i < points.length; i++) {
        if (points[i] != const Offset(-1, -1) &&
            points[i + 1] != const Offset(-1, -1)) {
          canvas.drawLine(points[i], points[i + 1], paintDetails);
        }
      }
    } catch (e) {}
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  final Paint paintDetails = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10.0
    ..color = Colors.black;
}
