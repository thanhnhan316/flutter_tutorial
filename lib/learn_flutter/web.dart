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

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [buildContent(), buildContentList()],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      color: Colors.amber,
      height: size.height * 0.2,
      child: CarouselSlider.builder(
          itemCount: arr.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                child: Image.network(image[index]),
                onTap: () {
                  setState(() {
                    i = index;
                  });
                },
              ),
            );
          },
          options: CarouselOptions(
            height: size.height * 0.21,
          )),
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
                color: Colors.amber,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(p.urlToImage == null || p.urlToImage == ''
                          ? Value().imagenull
                          : p.urlToImage),
                      Text(p.title),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
          onTap: () {
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => Web()));
          },
        );
      },
    );
  }
}
