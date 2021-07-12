import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'dart:convert';

class RulesViewer extends StatefulWidget {
  @override
  RulesViewerState createState() {
    return RulesViewerState();
  }
}

class RulesViewerState extends State<RulesViewer> {
  Future<List<Rule>> _getData() async {
    var response = await http.get(Uri.parse("http://127.0.0.1:8000/rules"),
        headers: {
          HttpHeaders.authorizationHeader: "Access-Control-Allow-Origin: *"
        });
    print("\n\nRESPONSE = " + response.body.toString());

    var data = json.decode(response.body);
    print("\n\n response.body = " + response.body.toString());

    List<Rule> rules = [];

    for (var r in data['rules']) {
      print(r.toString());
      Rule rule = Rule(r["ResourceId"], r["Name"], r["Uri"], r["Type"],
          r["GroupName"], r["Comment"], r["ModifiedBy"], r["ModifiedTime"]);

      rules.add(rule);
    }
    print(data.toString() + "\n\n");
    print("\n\nrules.length = " + rules.length.toString());

    return rules;
  }

  @override
  Widget build(BuildContext context) {
    //Text(dataTemp['rules'].length.toString())
    //SEARCH = https://medium.com/codechai/a-simple-search-bar-in-flutter-f99aed68f523
    return Scaffold(
        body: FutureBuilder(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("\n\nsnapshot.data == " + snapshot.data.toString());
              if (snapshot.data == null) {
                return Container(
                    child: Center(
                  child: Text("Loding..."),
                ));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: ExpansionTileCard(
                          baseColor: Colors.cyan[50],
                          expandedColor: Colors.grey,
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(snapshot.data[index].comment),
                          children: <Widget>[
                            Divider(
                              thickness: 1.0,
                              height: 1.0,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      "Description",
                                    )))
                          ],
                        ));
                  },
                );
              }
            }));
  }
}

class Rule {
  final String resourceId;
  final String name;
  final String uri;
  final String type;
  final String groupName;
  final String comment;
  final String modifiedBy;
  final String modifiedTime;
  //Change ufter initial test
  //final DateTime modifiedTime;

  //Constractor
  Rule(this.resourceId, this.name, this.uri, this.type, this.comment,
      this.groupName, this.modifiedBy, this.modifiedTime);
}
