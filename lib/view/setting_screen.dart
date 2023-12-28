import 'package:flutter/material.dart';

class setting_screen extends StatefulWidget {
  const setting_screen({super.key});
  static String id = 'setting_screen';

  @override
  State<setting_screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<setting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ListTile(
            //   leading: const Icon(Icons.person),
            //   title: Text("$session_fname $session_lname"),
            // ),
            ListTile(
              title: const Text('About Us'),
            ),
            ListTile(
              title: const Text('Help Center'),
            ),
            ListTile(
              title: const Text('Privacy Policy'),
            ),
            ListTile(
              title: const Text('Contact Us'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
