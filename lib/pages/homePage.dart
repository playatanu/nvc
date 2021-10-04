import 'package:carousel_slider/carousel_slider.dart';
import 'package:cpcoders/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> title = [];
  List<dynamic> date = [];
  List<dynamic> link = [];

  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  void initState() {
    _getdataFromWeb();

    super.initState();
  }

  Future<List> _getdataFromWeb() async {
    final url = Uri.parse('https://nvc.ac.in/');
    final response = await http.get(url);

    dom.Document document = parser.parse(response.body);

    final description = document.getElementsByClassName('wpcp-slide-image');

    title = description
        .map((element) =>
            element.getElementsByTagName("img")[0].attributes['src'])
        .toList();

    return title;
  }

  // ignore: unused_element

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                  : Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(title[itemIndex]),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.white38),
                            ),
                          ),
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            initialPage: 2,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              TagMode(
                                title: 'Update',
                              ),
                              TagMode(
                                title: 'Notice',
                              ),
                              TagMode(
                                title: 'Syllabus',
                              ),
                              TagMode(
                                title: 'v',
                              ),
                            ],
                          ),
                        ),
                        Glide(
                          title: 'Setting',
                          title2: 'Setting',
                        ),
                        Glide(
                          title: 'Setting',
                          title2: 'Setting',
                        ),
                        Glide(
                          title: 'Setting',
                          title2: 'Setting',
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class Glide extends StatelessWidget {
  const Glide({
    Key? key,
    required this.title,
    required this.title2,
  }) : super(key: key);

  final String title;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TagModeBox(
          title: title,
        ),
        TagModeBox(
          title: title2,
        ),
      ],
    );
  }
}

class TagMode extends StatelessWidget {
  const TagMode({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 122,
        height: 40,
        // width: MediaQuery.of(context).size.width,
        //  margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}

class TagModeBox extends StatelessWidget {
  const TagModeBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 150,
        // width: MediaQuery.of(context).size.width,
        //  margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.blue),
        child: Text(title),
      ),
    );
  }
}

/*

GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: myProducts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(myProducts[index]["name"]),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                          );
                        }),





*/