import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swag_health/utilities/constants.dart';
void main() => runApp(UserList());

class UserList extends StatelessWidget {
  final String apiUrl = "https://api.covid19india.org/data.json";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['statewise'];
  }

  String _name(dynamic user) {
    return user['state'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading:
                                Icon(Icons.show_chart, color: kColourPrimary),
                            title: Text(
                              _name(snapshot.data[index]),
                              style: kTextStyleDate,
                            ),
                            subtitle: Text(
                              "Confirmed :${(snapshot.data[index]['confirmed'].toString())}",
                              style: kData,
                            ),
                            trailing: SingleChildScrollView(
                              child: Column(children: <Widget>[
                                Text(
                                  " Active :${(snapshot.data[index]['active'].toString())}",
                                  style: kDataActive,
                                ),
                                Text(
                                  " Deaths :${(snapshot.data[index]['deaths'].toString())}",
                                  style: kDataDeath,
                                ),
                                Text(
                                  " Recovered :${(snapshot.data[index]['recovered'].toString())}",
                                  style: kDataRecoverd,
                                ),
                              ]),
                            ),
                            isThreeLine: true,
                            onTap: () {
                            },
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
