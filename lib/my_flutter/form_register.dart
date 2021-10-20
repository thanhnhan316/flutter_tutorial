import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fKey = GlobalKey<FormState>();
  var txtTenDangNhap = TextEditingController();
  var txtMatKhau = TextEditingController();
  var txtSoDt = TextEditingController();
  var txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildForm());
  }

  Widget buildForm() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: fKey,
          child: Column(
            children: [
              Text("Đăng ký",
                  style: TextStyle(color: Colors.red, fontSize: 20)),
              SizedBox(height: 30),

              //tên đăng nhập
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

              // số điện thoại
              TextFormField(
                controller: txtSoDt,
                validator: (value) {
                  Pattern pattern = (r'(^(?:[+0]9)?[0-9]{10,12}$)');
                  RegExp regex = new RegExp(pattern.toString());
                  if (value == null || value.isEmpty)
                    return "Vui lòng nhập số điện thoại";
                  else if (!regex.hasMatch(value))
                    return 'số điện thoại không hợp lệ';
                  else
                    return null;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.call),
                    hintText: "Sđt",
                    labelText: "Nhập Sđt"),
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
                    icon: Icon(Icons.email),
                    hintText: "Email",
                    labelText: "Nhập email"),
              ),

              //mật khẩu
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
                    icon: Icon(Icons.lock),
                    hintText: "Mật khẩu",
                    labelText: "Nhập mật khẩu"),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  child: Text("Đăng nhập"),
                  onPressed: () {
                    //nếu trước dấu ! khác null mới gọi được hàm validate
                    if (fKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  "Tên đăng nhập: ${txtTenDangNhap.text},Số điện thoại: ${txtSoDt.text}, Email: ${txtEmail.text}, Mật khẩu: ${txtMatKhau.text}"),
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
