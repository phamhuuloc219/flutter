// import 'package:flutter/material.dart';
//
// class MyWebPage extends StatefulWidget {
//   String url, nameResource;
//   MyWebPage({required this.url, required this.nameResource,super.key});
//
//   @override
//   State<MyWebPage> createState() => _MyWebPageState();
// }
//
// class _MyWebPageState extends State<MyWebPage> {
//   late final WebViewController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
//
//   @override
//   void initState() {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://flutter.dev'));
//   }
// }
