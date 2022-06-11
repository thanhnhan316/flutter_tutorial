import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;

class CallApiLogin extends StatelessWidget {
  const CallApiLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var fKey = GlobalKey<FormState>();
  var txtId = TextEditingController();
  var txtName = TextEditingController();
  var txtUserName = TextEditingController();
  var txtEmail = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Future<List<User>> FetchData() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    var client = htpp.Client();
    var reponse = await client.get(Uri.parse(url));
    var resule = reponse.body;
    var jsonData = jsonDecode(resule);
    List<User> lsUser = [];
    print(jsonData);
    for (var item in jsonData) {
      User u = new User(
          id: item['id'],
          name: item['name'],
          userName: item["username"],
          email: item['email']);
      lsUser.add(u);
    }
    return lsUser;
  }

  Widget buildBody() {
    return Form(
        key: fKey,
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("Đăng ký ", style: TextStyle(fontSize: 25, color: Colors.red)),
            SizedBox(height: 35),

            //id
            TextFormField(
              controller: txtId,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Vui lòng nhập id";
                else
                  return null;
              },
              decoration: InputDecoration(
                  hintText: "Id", labelText: "Nhập Id", icon: Icon(Icons.face)),
            ),

            //name
            TextFormField(
              controller: txtName,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Vui lòng nhập tên";
                else
                  return null;
              },
              decoration: InputDecoration(
                  hintText: "Tên",
                  labelText: "Nhập Tên",
                  icon: Icon(Icons.person)),
            ),

            //username
            TextFormField(
              controller: txtUserName,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Vui lòng nhập họ tên";
                else
                  return null;
              },
              decoration: InputDecoration(
                  hintText: "Họ tên",
                  labelText: "Nhập họ tên",
                  icon: Icon(Icons.person)),
            ),

            //email
            TextFormField(
              controller: txtEmail,
              validator: (value) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern.toString());
                if (value == null || value.isEmpty)
                  return "Vui lòng nhập email";
                else if (!regex.hasMatch(value))
                  return "Email chưa hợp lệ";
                else
                  return null;
              },
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Nhập email",
                  icon: Icon(Icons.email)),
            ),

            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                if (fKey.currentState!.validate()) {}
              },
              child: Container(
                color: Colors.red,
                width: 200,
                height: 50,
                child: Center(
                    child: Text("Đăng ký",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            )
          ],
        ));
  }
}

class User {
  final String id;
  final String name;
  final String userName;
  final String email;

  User(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email});
}
