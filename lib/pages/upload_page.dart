import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hello_mnist2/dl_model/classifier.dart';
import 'dart:io';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final imagePicker = ImagePicker();
  Classifier classifier = Classifier();
  late XFile imageFile;
  int digit = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.camera_alt_outlined),
        tooltip: "choose image",
        onPressed: () async {
          try {
            imageFile =
                (await imagePicker.pickImage(source: ImageSource.gallery))!;
            digit = await classifier.classifyImage(imageFile);
          } catch (e) {
            digit = -1;
          }

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
              "Image will be shown below",
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
                image: DecorationImage(
                  image: digit == -1
                      ? const AssetImage("assets/images/white.jpg")
                          as ImageProvider
                      : FileImage(
                          File(imageFile.path),
                        ),
                  fit: BoxFit.fitWidth,
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
