// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Web extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<Web> {
//   Completer<WebViewController> _controller = Completer<WebViewController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('InAppWebView Example'),
//         ),
//         body: WebView(
//           initialUrl: "https://pub.dev/packages/webview_flutter",
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webController) {
//             _controller.complete(webController);
//           },
//         ));
//   }
// }
