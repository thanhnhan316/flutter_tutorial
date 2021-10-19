import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/learn_flutter/callfakeapi.dart';
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
  late Size size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
            return GridView.count(
              padding: EdgeInsets.all(7),
              crossAxisCount: 2,
              children: List.generate(data.length, (index) {
                Product p = data[index];
                return buildItem(p);
              }),
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

  Widget buildItem(Product p) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(p.imgge,
                height: size.height * 0.135,
                width: size.width * 0.27,
                fit: BoxFit.fill),
            Text(
              p.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${p.price}\$",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.amber[700],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Mua hàng ngay'),
                        content: const Text('».·º`·.LOVE.·´º·.« '),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Để sau'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Mua'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                    child: Text("Mua ngay",
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                    decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Thêm vào giỏ hàng'),
                          content: const Text('Thêm vào nào hihihi (-_-)'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Để sau'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Thêm'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.amber[700],
                      size: 20,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
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
