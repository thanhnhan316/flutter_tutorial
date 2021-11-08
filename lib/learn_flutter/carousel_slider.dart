import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/model/Product_model.dart';
import 'package:hello_world/service/service.dart';

class CarouselScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Carousel Slider', home: BuidlCarousel());
  }
}

class BuidlCarousel extends StatefulWidget {
  const BuidlCarousel({Key? key}) : super(key: key);

  @override
  _BuidlCarouselState createState() => _BuidlCarouselState();
}

class _BuidlCarouselState extends State<BuidlCarousel> {
  int count = 0;
  late Size size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Service().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildBody(),
      backgroundColor: Color(0xffAF9F9F),
    );
  }

  Widget buildBody() {
    return FutureBuilder(
        future: Service().fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return buildItem(data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget buildItem(List<Product> ls) {
    return Center(
      child: CarouselSlider.builder(
          itemCount: ls.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return buildContent(ls[index]);
          },
          options: CarouselOptions(
            height: size.height * 0.7,
          )),
    );
  }

  Widget buildContent(Product p) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Image.network(
            p.imgge,
            width: size.width * 0.5,
            height: size.height * 0.4,
            fit: BoxFit.contain,
          ),
          Text(
            p.title,
            maxLines: 2,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildMuaNgay(),
              Icon(
                Icons.shopping_cart,
                color: Colors.amber[700],
                size: 50,
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            "${p.price}\$",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 30,
              color: Colors.amber[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMuaNgay() {
    return GestureDetector(
      onTap: () {
        setState(() {
          count = 0;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    title: const Text('Mua hàng ngay'),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 20),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                            },
                            icon: Icon(Icons.add)),
                        Text("$count"),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (count > 0) count--;
                              });
                            },
                            icon: Icon(Icons.minimize)),
                        SizedBox(width: 20)
                      ],
                    ),
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
                  );
                }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        child: Text("Mua ngay",
            style: TextStyle(fontSize: 28, color: Colors.white)),
        decoration: BoxDecoration(
            color: Colors.amber[700], borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
