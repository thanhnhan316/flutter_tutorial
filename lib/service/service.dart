import 'package:hello_world/model/Product_model.dart';
import 'package:hello_world/model/profile_model.dart';
import 'package:hello_world/model/tesla_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Future<List<Product>> fetchData() async {
    String url = "https://fakestoreapi.com/products?limit=100";
    var client = http.Client();
    var reponse = await client.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var result = reponse.body;
      var jsonData = json.decode(result);
      print(jsonData);
      List<Product> ls = [];

      for (var item in jsonData) {
        dynamic rate = item["rating"]["rate"];
        dynamic count = item["rating"]["count"];
        Rating rating = new Rating(rate: rate, coutn: count);
        Product p = new Product(
          id: item["id"],
          title: item["title"],
          price: item["price"],
          description: item["description"],
          category: item["category"],
          imgge: item["image"],
          rating: rating,
        );

        print("============================= $p");
        ls.add(p);
      }
      return ls;
    } else {
      return throw Exception('Không có dữ liệu');
    }
  }

  Future<Profile_model> fetchDataProfile() async {
    String url = "https://randomuser.me/api/";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      //lấy dữ liệu về
      // trong trường hợp này thì json data ko cần cũng dc
      var jsonData = json.decode(reponse.body);
      print(jsonData);
      Profile_model ls = ProfileFromJson(reponse.body);
      return ls;
    } else {
      return throw Exception('Không có dữ liệu');
    }
  }

  Future<Tesla_model> fetchDataTesla(dynamic s) async {
    String url = s == null
        ? "https://newsapi.org/v2/everything?q=tesla&from=2021-10-14&sortBy=publishedAt&apiKey=f650a93f63634105a75a352e57de91ec"
        : s;
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);
      Tesla_model tl = TeslaFromJson(reponse.body);
      print(tl);
      return tl;
    } else {
      return throw Exception('Không có dữ liệu');
    }
  }
}