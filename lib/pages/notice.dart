import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:nvc/styles/color.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key, required this.isAppbar}) : super(key: key);
  final bool isAppbar;

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  List<dynamic> title = [];
  List<dynamic> date = [];
  List<dynamic> link = [];

  @override
  void initState() {
    _getdataFromWeb();

    super.initState();
  }

  Future<List> _getdataFromWeb() async {
    final url = Uri.parse('https://nvc.ac.in/noticenoard/');

    try {
      final response = await http.get(url);

      dom.Document document = parser.parse(response.body);

      final description = document.getElementsByClassName('__dt_row');

      title = description
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      final linkx = document
          .getElementsByClassName('__dt_col_3 __dt_col __dt_col_download_link');

      link = linkx
          .map((element) => element
              .getElementsByClassName('wpdm-download-link btn btn-primary')[0]
              .attributes['onclick'])
          .toList();

      final datex = document.getElementsByClassName('__dt_row');

      date = datex
          .map((element) =>
              element.getElementsByClassName('__dt_update_date ')[0].innerHtml)
          .toList();
    } catch (e) {
      final snackBar = SnackBar(
        content: const Text('Hey! No internet connection!'),
        action: SnackBarAction(
          label: 'Retry',
          onPressed: () {
            _getdataFromWeb();
            //  setState(() {});
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

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
                'Notice',
                style: TextStyle(color: Colors.blue),
              ),
              backgroundColor: Colors.white,
            ),
      body: RefreshIndicator(
        onRefresh: _getdataFromWeb,
        child: FutureBuilder(
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
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            {
                              launch(
                                  link[index].replaceAll(
                                      new RegExp("location.href='"), ''),
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
                            }
                          },
                          child: ListTile(
                            title: Text(
                              title[index],
                            ),
                            subtitle: Text(date[index]),
                            trailing: Icon(
                              Icons.download_outlined,
                              color: blue,
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
