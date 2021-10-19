import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenShoppe extends StatelessWidget {
  const ScreenShoppe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuildShoppe(),
    );
  }
}

class BuildShoppe extends StatefulWidget {
  const BuildShoppe({Key? key}) : super(key: key);

  @override
  _BuildShoppeState createState() => _BuildShoppeState();
}

class _BuildShoppeState extends State<BuildShoppe> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                Product p = data[index];
                return Card(
                  child: Column(
                    children: [
                      Text("${p.id}"),
                      Text(p.title),
                      Text(p.description),
                      Text(p.category),
                      Text("${p.price}"),
                      Image.network(p.imgge),
                      SizedBox(height: 20)
                    ],
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List<Product>> fetchData() async {
    String url = "https://fakestoreapi.com/products?limit=100";
    var client = http.Client();
    var reponse = await client.get(Uri.parse(url));
    var result = reponse.body;
    var jsonData = jsonDecode(result);
    List<Product> ls = [];
    for (var item in jsonData) {
      if (item["price"] != null) {
        Product p = new Product(
          id: item["id"],
          title: item["title"],
          price: item["price"],
          description: item["description"],
          category: item["category"],
          imgge: item["image"],
        );
        print("============================= $p");
        ls.add(p);
      }
    }
    return ls;
  }
}

class Product {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String imgge;
  // final double rate;
  // final Long count;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imgge,
  });
}
