import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../provider/homeProvider.dart';

class webviewScreen extends StatefulWidget {
  const webviewScreen({Key? key}) : super(key: key);

  @override
  State<webviewScreen> createState() => _webviewScreenState();
}

class _webviewScreenState extends State<webviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: "${Provider.of<homeProvider>(context,listen: false).datapicker!.url}",
        ),
      ),
    );
  }
}
