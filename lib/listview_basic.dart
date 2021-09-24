import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Xin Chao",
      home: _ListViewBasic(),
    );
  }
}

class _ListViewBasic extends StatefulWidget {
  const _ListViewBasic({Key? key}) : super(key: key);

  @override
  __ListViewBasicState createState() => __ListViewBasicState();
}

class __ListViewBasicState extends State<_ListViewBasic> {
  var data = generateWordPairs().take(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List view basic"),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.black,
                        ),
                        title: Text(
                          data.elementAt(index).asSnakeCase,
                          style: TextStyle(color: Colors.red, fontSize: 22),
                        ),
                        subtitle: Text("mo ta ??"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.room)),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
