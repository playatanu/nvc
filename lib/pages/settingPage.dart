import 'package:cpcoders/styles/color.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required this.isAppbar}) : super(key: key);
  final bool isAppbar;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (widget.isAppbar == true)
            ? null
            : AppBar(
                iconTheme: IconThemeData(color: blue),
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.blue),
                ),
                backgroundColor: Colors.white,
              ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            UserAccountsDrawerHeader(
              accountEmail: null,
              accountName: null,
              decoration: new BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/logo.jpg'),
                    fit: BoxFit.fitHeight),
              ),
            ),
            Center(
              child: Text(
                'Welcome to Nabadwip Vidyasagar College',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('Address'),
                subtitle: Text('Pacca Tole Road, Nabadwip, Nadia – 741302')),
            ListTile(
                leading: Icon(Icons.phone_outlined),
                title: Text('Phone'),
                subtitle: Text('03472 240014')),
            ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text('Mail'),
                subtitle: Text('nvcollege1942@gmail.com')),
            SizedBox(
              height: 40,
            ),
            Center(child: Expanded(child: Text('PLAYATANU'))),
            SizedBox(
              height: 40,
            ),
          ],
        ));
  }
}
