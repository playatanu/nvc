import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'pages/landing.dart';
import 'pages/notice.dart';
import 'pages/settingPage.dart';
import 'styles/color.dart';

void main() {
  runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'NVC App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<String> studentLogin = [
    'https://nvcollege.co.in/18191SemFF/logIn.aspx',
    'https://nvcollege.co.in/18191SemFF/logIn.aspx'
  ];
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    //HomePage(),
    NoticePage(
      isAppbar: true,
    ),
    LandinPage(
      isAppbar: true,
    ),

    // NoticePage(
    //   isAppbar: true,
    // ),
    SettingPage(
      isAppbar: true,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _launchCallerHelpLine2() async {
    const url = "tel:7365098574";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchCallerHelpLine3() async {
    const url = "tel:7365098575";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWhatsapp() async {
    const url = "https://chat.whatsapp.com/GukB3k4dtkgJQA91OVrTwH";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchFacebook() async {
    const url =
        "https://www.facebook.com/Nabadwip-Vidyasagar-College-123064707756003/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWeb() async {
    const url = "https://nvc.ac.in/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: blue),
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              'assets/logo.gif',
              fit: BoxFit.cover,
            ),
          )),
      drawer: Drawer(
        child: Container(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserAccountsDrawerHeader(
                  accountEmail: null,
                  accountName: null,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoticePage(
                                isAppbar: false,
                              )),
                    );
                  },
                  child: ListTile(
                      leading: Icon(Icons.campaign),
                      title: Text('Notice'),
                      trailing: Icon(
                        Icons.fiber_new_outlined,
                        color: blue,
                      ))),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LandinPage(
                                isAppbar: false,
                              )),
                    );
                  },
                  child: ListTile(
                      leading: Icon(Icons.new_releases),
                      title: Text('Updates'),
                      trailing: Icon(
                        Icons.fiber_new_outlined,
                        color: blue,
                      ))),
              InkWell(
                onTap: () {
                  launch(studentLogin[0],
                      forceSafariVC: false,
                      forceWebView: false,
                      headers: <String, String>{'header_key': 'header_value'});
                },
                child: ListTile(
                    title: Text('Student Login'),
                    leading: Icon(Icons.portrait)),
              ),
              InkWell(
                  onTap: () {
                    _launchFacebook();
                  },
                  child: ListTile(
                    leading: Icon(Icons.facebook),
                    title: Text('Facebook'),
                  )),
              InkWell(
                  onTap: () {
                    _launchCallerHelpLine2();
                  },
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Help Line'),
                    subtitle: Text('7365098574'),
                  )),
              InkWell(
                  onTap: () {
                    _launchCallerHelpLine3();
                  },
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Help Line 2'),
                    subtitle: Text('7365098575'),
                  )),
              InkWell(
                  onTap: _launchWeb,
                  child: ListTile(
                    leading: Icon(Icons.web),
                    title: Text('Website'),
                  )),
              InkWell(
                  onTap: () {
                    _launchWhatsapp();
                  },
                  child: ListTile(
                    leading: Icon(Icons.whatshot),
                    title: Text('WhatsApp (UnOfficial)'),
                  )),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upcoming_outlined),
            label: 'Updates',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.book_outlined),
          //   label: 'Syllabus',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: blue,
        unselectedItemColor: blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
