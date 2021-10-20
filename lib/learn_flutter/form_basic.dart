import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormBasic(),
    );
  }
}

class FormBasic extends StatefulWidget {
  const FormBasic({Key? key}) : super(key: key);

  @override
  _FormBasicState createState() => _FormBasicState();
}

class _FormBasicState extends State<FormBasic> {
  var fKey = GlobalKey<FormState>();
  var txtTenDangNhap = TextEditingController();
  var txtMatKhau = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: build_body(),
    );
  }

  Widget build_body() {
    return Form(
        key: fKey,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Text("Đăng nhập hệ thống",
                  style: TextStyle(color: Colors.red, fontSize: 20)),
              SizedBox(height: 30),
              TextFormField(
                controller: txtTenDangNhap,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Vui lòng nhập tên đăng nhập";
                  else
                    return null;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Tên đăng nhập",
                    labelText: "Nhập tên đăng nhập"),
              ),
              TextFormField(
                controller: txtMatKhau,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Vui lòng nhập mật khẩu";
                  else if (value.length < 6)
                    return "Mật khẩu it nhất phải 6 ký tự";
                  else
                    return null;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.lock_open),
                    hintText: "Mật khẩu",
                    labelText: "Nhập mật khẩu"),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text("Đăng nhập"),
                  onPressed: () {
                    //nếu trước dấu ! khác null mới gọi được hàm validate
                    // bắt buộc phải có   if (_formKey.currentState! .validate ()) để xử lý dử liệu
                    if (fKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  "Tên đăng nhập: ${txtTenDangNhap.text}, Mật khẩu: ${txtMatKhau.text}"),
                            );
                          });
                      print("Okee, ${txtTenDangNhap.text} ");
                    } else
                      print("not passs");
                  })
            ],
          ),
        ));
  }
}
