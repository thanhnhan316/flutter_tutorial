// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// //Nhà cung cấp
// class CountProvider extends ChangeNotifier {
//   int _counter = 10;
//   int get counter => _counter;

//   void add() {
//     _counter++;
//     notifyListeners();
//   }

//   void min() {
//     _counter--;
//     notifyListeners();
//   }
// }

// class Provider extends StatelessWidget {
//   const Provider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //Nhà phân phối (kết nối đến người sử dụng)
//     return ChangeNotifierProvider(
//         create: (_) => CountProvider(), child: ProviderScreen());
//   }
// }

// class ProviderScreen extends StatefulWidget {
//   const ProviderScreen({Key? key}) : super(key: key);

//   @override
//   State<ProviderScreen> createState() => _ProviderScreenState();
// }

// class _ProviderScreenState extends State<ProviderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                   // lắng nghe sự thay đổi
//                   context.watch<CountProvider>().counter.toString(),
//                   style: TextStyle(fontSize: 30)),
//               IconButton(
//                   onPressed: () {
//                     //đọc giá trị, hàm, thuộc tính,..
//                     context.read<CountProvider>().min();
//                   },
//                   icon: Icon(Icons.minimize))
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               context.read<CountProvider>().add();
//             },
//             child: Icon(Icons.add)));
//   }
// }
