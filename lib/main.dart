import 'package:flutter/material.dart';
import 'package:hello_mnist2/pages/upload_page.dart';
import 'package:hello_mnist2/pages/draw_page.dart';
import 'package:hello_mnist2/pages/menu_item.dart';
import 'package:hello_mnist2/pages/aboutus_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List tabs = [
    const DrawPage(),
    const UploadImage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text(
            "Digit Recognizer",
            style: TextStyle(fontFamily: 'Lobster', fontSize: 30, letterSpacing: 3),
          ),
        ),
        actions: [
          PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    ...MenuItems.itemsone.map(buildItem).toList(),
                  ])
        ],
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "Draw"),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  void onSelected(contenx, MenuItem item) {
    switch (item) {
      case MenuItems.itemAbout:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AboutUsPage()),
        );

        break;

      default:
    }
  }
}
