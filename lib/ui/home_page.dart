//import 'dart:async';
//import 'dart:convert';
//
////import 'package:basic_utils/basic_utils.dart';
//import 'package:flutter/material.dart';
//import "package:http/http.dart" as http;
//
//import 'detail_pokemon.dart.dart';
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController editingController = TextEditingController();
//  String url = 'https://pokeapi.co/api/v2/pokemon/?limit=10';
//  List data;
//
//  Future<String> makeRequest() async {
//    var response = await http.get(
//        Uri.encodeFull(url), headers: {"Accept": "application/json"});
//
//    setState(() {
//      var extractData = json.decode(response.body);
//      data = extractData["results"];
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    makeRequest();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Pokemon List'),
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(15.0),
//              child: TextField(
//                onChanged: (value) {},
//                decoration: InputDecoration(
//                  labelText: "Search",
//                  hintText: "Search",
//                  contentPadding: const EdgeInsets.all(10.0),
//                  prefixIcon: Icon(Icons.search),
//                  border: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
//                ),
//              ),
//            ),
//            Expanded(
//              child: ListView.builder(
//                  itemCount: data == null ? 0 : data.length,
//                  itemBuilder: (BuildContext context, i) {
//                    return ListTile(
//                      title: Text(data[i]["name"].toString().toUpperCase()),
//                      subtitle: Text(data[i]["url"]),
//                      //  leading:  CircleAvatar(
//                      // backgroundImage:
//                      //  NetworkImage(data[i]["picture"]["thumbnail"]),
//                      //  ),
//                      onTap: () {
//                        Navigator.push(
//                            context, MaterialPageRoute(builder: (
//                            BuildContext context) => SecondPage(data[i])));
//                      },
//                    );
//                  }),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//