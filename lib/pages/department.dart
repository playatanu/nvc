import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:nvc/styles/color.dart';

class DepaerPage extends StatefulWidget {
  const DepaerPage({Key? key}) : super(key: key);

  @override
  _DepaerPagePageState createState() => _DepaerPagePageState();
}

class _DepaerPagePageState extends State<DepaerPage> {
  List<dynamic> title = [
    {'link': 'botany', 'title': 'Botanny'},

    //   'chemistry',
    //   'computer-science',
    //   'economics',
    //   'environmental-science'
    // }
  ];
  List<dynamic> date = [];
  List<dynamic> link = [];

  @override
  void initState() {
    _getdataFromWeb();

    super.initState();
  }

  Future<List> _getdataFromWeb() async {
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          {
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
                          subtitle: Text('Science Deperment'),
                          trailing: Icon(
                            Icons.download_for_offline_outlined,
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
    );
  }
}
