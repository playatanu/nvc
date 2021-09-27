import 'package:cpcoders/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class LandinPage extends StatefulWidget {
  const LandinPage({Key? key, required this.isAppbar}) : super(key: key);
  final bool isAppbar;

  @override
  _LandinPageState createState() => _LandinPageState();
}

class _LandinPageState extends State<LandinPage> {
  List<dynamic> title = [];
  List<dynamic> link = [];

  @override
  void initState() {
    _getdataFromWeb();
    super.initState();
  }

  Future<List> _getdataFromWeb() async {
    final url = Uri.parse('https://nvcollege.co.in/');
    final response = await http.get(url);

    dom.Document document = parser.parse(response.body);

    final description = document.getElementsByClassName('box');

    title = description
        .map((element) => element.getElementsByTagName("a")[0].innerHtml)
        .toList();
    link = description
        .map((element) =>
            element.getElementsByTagName("a")[0].attributes['href'])
        .toList();

    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.isAppbar == true)
          ? null
          : AppBar(
              iconTheme: IconThemeData(color: blue),
              title: Text(
                'Updates',
                style: TextStyle(color: Colors.blue),
              ),
              backgroundColor: Colors.white,
            ),
      body: FutureBuilder(
        future: _getdataFromWeb(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (title.length == 0)
              ? Center(
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 5.0,
                    color: blue,
                  ),
                )
              : ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        var urli = link[index];
                        var urlx = 'https://nvcollege.co.in/' + '$urli';
                        launch(urlx,
                            forceSafariVC: false,
                            forceWebView: false,
                            headers: <String, String>{
                              'header_key': 'header_value'
                            });

                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebView(
                                    link: link[index],
                                  )),
                        );*/
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.fiber_new_outlined,
                          color: blue,
                        ),
                        title: Text(
                          title[index],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
