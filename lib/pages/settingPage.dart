import 'package:flutter/material.dart';
import 'package:nvc/styles/color.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required this.isAppbar}) : super(key: key);
  final bool isAppbar;

  @override
  _SettingPageState createState() => _SettingPageState();
}

_launchWeb() async {
  const url = "https://nvc.ac.in/";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_openMap() async {
  const url =
      'https://www.google.com/maps/search/?api=1&query=23.41011060312435,88.36444923779895';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sendMail() async {
  // Android and iOS
  const uri = 'mailto:nvcollege1942@gmail.com';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

_launchCaller() async {
  const url = "tel:03472 240014";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchWhatsapp() async {
  const url = "https://wa.me/916296843271";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
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
        body: Container(
          child: SingleChildScrollView(
            child: Column(
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
                InkWell(
                  onTap: () {
                    _openMap();
                  },
                  child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text('Address'),
                      subtitle:
                          Text('Pacca Tole Road, Nabadwip, Nadia – 741302')),
                ),
                InkWell(
                  onTap: () {
                    _launchCaller();
                  },
                  child: ListTile(
                      leading: Icon(Icons.phone_outlined),
                      title: Text('Phone'),
                      subtitle: Text('03472 240014')),
                ),
                InkWell(
                  onTap: () {
                    _sendMail();
                  },
                  child: ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Text('Mail'),
                      subtitle: Text('nvcollege1942@gmail.com')),
                ),
                InkWell(
                  onTap: () {
                    _launchWeb();
                  },
                  child: ListTile(
                      leading: Icon(Icons.web_outlined),
                      title: Text('Website'),
                      subtitle: Text('https://nvc.ac.in/')),
                ),
                Divider(
                  color: Colors.black,
                  indent: 50,
                  endIndent: 50,
                ),
                InkWell(
                    onTap: () {
                      _launchWhatsapp();
                    },
                    child: ListTile(
                      leading: Icon(Icons.person_outline_outlined),
                      title: Text('Atanu Debnath'),
                      subtitle: Text('App Developer'),
                    )),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                ),
                Center(child: Expanded(child: Text('PLAYATANU'))),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
