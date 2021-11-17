import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/config/value.dart';
import 'package:hello_world/learn_flutter/showcontent.dart';
import 'package:hello_world/model/tesla_model.dart';
import 'package:hello_world/service/service.dart';

class WebScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Carousel Slider', home: BuidlWeb());
  }
}

class BuidlWeb extends StatefulWidget {
  const BuidlWeb({Key? key}) : super(key: key);

  @override
  _BuidlWeblState createState() => _BuidlWeblState();
}

class _BuidlWeblState extends State<BuidlWeb> {
  int count = 0;
  late Size size;
  int i = 0;
  var arr = [
    Service().fetchDataTesla(Value().tesla),
    Service().fetchDataTesla(Value().apple),
    Service().fetchDataTesla(Value().domains)
  ];
  var image = [Value().imageTesla, Value().imageapple, Value().imagedomain];
  var str = ["Testla", "Apple", "Domains"];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody() {
    return NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
             SliverAppBar(
                collapsedHeight: size.height * 0.22,
                automaticallyImplyLeading: false,
                snap: true,
                floating: true,
                flexibleSpace: Column(children: [buildTest(), buildContent()]),
              )
          ];
        },
        body: buildContentList());
    // SingleChildScrollView(
    //   child: Column(
    //     children: [buildTest(), buildContent(), buildContentList()],
    //   ),
    // );
  }

  Widget buildTest() {
    return Container(
      height: size.height * 0.05,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "flutter",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "News",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue[300]),
          )
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      color: Colors.white,
      height: size.height * 0.17,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: arr.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 7, left: 7),
                  width: size.width * 0.45,
                  height: size.height * 0.135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image[index])),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.redAccent,
                  ),
                ),
                Text(str[index],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19))
              ],
            ),
            onTap: () {
              setState(() {
                i = index;
              });
            },
          );
        },
      ),
    );
  }

  Widget buildContentList() {
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height * 0.84,
      child: FutureBuilder(
          future: arr[i],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Tesla_model t = snapshot.data;
              return buildList(t.articles);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildList(List<Article> ls) {
    return ListView.builder(
      itemCount: ls.length,
      itemBuilder: (BuildContext context, int index) {
        Article p = ls[index];
        return GestureDetector(
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(p.urlToImage == null || p.urlToImage == ''
                          ? Value().imagenull
                          : p.urlToImage),
                      Text(
                        p.title,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        p.content,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Web(content: p.content, tittle: p.title)));
          },
        );
      },
    );
  }
}
