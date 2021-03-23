import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'category_model.dart';
import 'package:swag_health/DetailsPage.dart';
import 'package:http/http.dart' as http;

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  NewsState createState() => NewsState();
}

class NewsState extends State<NewsPage> {
  List<Category> list1 = List<Category>();
  List data;
  String url =
      'https://newsapi.org/v2/everything?q=covid19&apiKey=18a63c0a5fa54180957213c1657d3e77';
  @override
  void initState() {
    fetch_data_from_api();
    super.initState();
  }

  Future<String> fetch_data_from_api() async {
    var jsondata = await http.get(url);
    var fetchdata = jsonDecode(jsondata.body);
    setState(() {
      data = fetchdata["articles"];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(children: <Widget>[
              Container(
                  color: Colors.black,
                  height: 250,
                  child: Row(children: <Widget>[
                    Container(
                      height: 200.0,
                      child: Card(
                        child: Image.asset(
                          'assets/user.png',
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 40.0, left: 60),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "John ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "30 Orders",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ))
                  ])),
              Container(
                margin: EdgeInsets.only(top: 250.0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  author: data[index]["author"],
                                  title: data[index]["title"],
                                  description: data[index]["description"],
                                  urlToImage: data[index]["urlToImage"],
                                  publishedAt: data[index]["publishedAt"],
                                )));
                      },
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                              ),
                              child: Image.network(
                                data[index]["urlToImage"],
                                fit: BoxFit.cover,
                                height: 400.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                            child: Container(
                              height: 200.0,
                              width: 400.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                elevation: 10.0,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                                      child: Text(
                                        data[index]["title"],
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: data == null ? 0 : data.length,
                ),
              )
            ])));
  }
}