import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetWidget<NewsDetailController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDetailView'),
        centerTitle: true,
      ),
      body: WebView(
        backgroundColor: Colors.white,
        initialUrl: 'https://www.engadget.com/new-york-cryptocurrency-bill-bitcoin-mining-climate-change-161126292.html',
      ),
    );
  }
}
