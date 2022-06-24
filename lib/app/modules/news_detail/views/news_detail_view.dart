import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetWidget<NewsDetailController> {
  @override
  Widget build(BuildContext context) {
    var webUrl = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDetailView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Stack(
          children: [
            WebView(
              backgroundColor: Colors.white,
              initialUrl: '$webUrl',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                controller.isWebviewLoading.value = false;
              },
            ),
            controller.isWebviewLoading.value
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Stack()
          ],
        );
      }),
    );
  }
}
