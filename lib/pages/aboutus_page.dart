import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sahil Kavitake',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  letterSpacing: 3),
            ),
            const Text(
              'Aspiring Data Scientist ',
              style: TextStyle(
                  fontSize: 20.0, color: Colors.black, letterSpacing: 3),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                  fontSize: 20.0, color: Colors.black, letterSpacing: 3),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  color: Colors.black,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25),
                  child: const ListTile(
                    leading: Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.redAccent,
                      size: 24.0,
                    ),
                    title: Text(
                      'sahil.kavitake202@gmail.com',
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25),
                  child: const ListTile(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    leading: Icon(
                      Icons.phone_sharp,
                      color: Colors.redAccent,
                      size: 24.0,
                    ),
                    title: Text(
                      '+91 8459225341',
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
