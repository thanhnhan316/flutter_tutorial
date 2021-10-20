import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp4 extends StatelessWidget {
  const MyApp4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage4(),
    );
  }
}

class HomePage4 extends StatefulWidget {
  const HomePage4({Key? key}) : super(key: key);

  @override
  _HomePage4State createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  late Future<List<Photo>> lsPhoto;

  @override
  void initState() {
    super.initState();
    // lsPhoto = Photo.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data as List<Photo>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  Photo p = data[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.network(p.thumbnailUrl),
                        Text(p.tittel),
                        SizedBox(height: 10)
                      ],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }

  Future<List<Photo>> fetchData() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    var client = http.Client();
    var reponse = await client.get(Uri.parse(url));
    //nếu đúng thì trả về 200
    // if (reponse.statusCode == 200) {
    var result = reponse.body;
    //ép kiểu jsondata
    var jsonData = jsonDecode(result);
    List<Photo> ls = [];
    for (var item in jsonData) {
      Photo p = new Photo(
          albumid: item["albumId"],
          id: item["id"],
          tittel: item["title"],
          url: item["url"],
          thumbnailUrl: item["thumbnailUrl"]);
      ls.add(p);
    }
    return ls;
  }
}

class Photo {
  final int albumid;
  final int id;
  final String url;
  final String thumbnailUrl;
  final String tittel;
  Photo(
      {required this.albumid,
      required this.id,
      required this.tittel,
      required this.url,
      required this.thumbnailUrl});
}
