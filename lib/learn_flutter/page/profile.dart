import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/model/profile_model.dart';
import 'package:hello_world/service/service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Size size;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  @override
  void initState() {
    super.initState();
    Service().fetchDataProfile();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: false,
        body: FutureBuilder(
            future: Service().fetchDataProfile(),
            builder: (BuildContext context, AsyncSnapshot snapshop) {
              if (snapshop.hasData) {
                return buildBody(snapshop.data);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Widget buildBody(Profile_model data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: size.height * 0.07),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 35),
            Text(
              "Profile",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[800]),
            ),
            Text(
              "save",
              style: TextStyle(
                fontSize: 20,
                color: Colors.yellow[800],
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.03),
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(data.results[0].picture.large),
        ),
        SizedBox(height: size.height * 0.05),
        Container(
            padding: EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.55,
            color: Colors.grey[200],
            child: Column(
              children: [
                buildItem('First Name', data.results[0].name.first),
                buildItem('Last Name', data.results[0].name.last),
                buildItem('Company Email', data.results[0].email)
              ],
            ))
      ],
    );
  }

  Widget buildItem(String name, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          width: size.width,
          padding: EdgeInsets.all(27),
          child: Text(
            content,
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}
