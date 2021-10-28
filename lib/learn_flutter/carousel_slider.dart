import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/model/Product_model.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuildCarouselSlider(),
    );
  }
}

class BuildCarouselSlider extends StatefulWidget {
  const BuildCarouselSlider({Key? key}) : super(key: key);

  @override
  _BuildCarouselSliderState createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildBody(),
    );
  }

  Widget BuildBody() {
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data as List<Product>;
          // if (snapshot.hasData) {
          //   return  CarouselSlider.builder(
          //       itemCount: data.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Text(data[index].title);
          //       },
          //       options: CarouselOptions(height: 400));
          // }
          return CircularProgressIndicator();
        });
  }

  Widget buildCarou(Product p, int i) {
    return Container(
      color: Colors.red,
    );
  }
}
