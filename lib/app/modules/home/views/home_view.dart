import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_danafix/app/modules/widgets/card_list_widget.dart';
import 'package:technicaltest_danafix/app/routes/app_pages.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsReader',
          style: GoogleFonts.abhayaLibre(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: const Icon(Icons.search)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Text(
              'Headlines from ESPN',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),

          /// list headlines from ESPN
          Obx(() {
            return (controller.loadingState == LoadingState.loading)
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                : (controller.listArticles.length == 0)
                    ? const Expanded(
                        child: Center(
                          child: Text('Data Kosong!'),
                        ),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          controller: controller.refreshController.value,
                          enablePullUp: true,
                          enablePullDown: false,
                          onLoading: controller.pagination,
                          child: ListView.builder(
                            itemCount: (controller.listArticles.length >=
                                    controller.limit.value)
                                ? controller.limit.value
                                : controller.listArticles.length,
                            itemBuilder: ((context, index) {
                              var webUrl = controller.listArticles[index].url;
                              return CardListWidget(
                                image:
                                    controller.listArticles[index].urlToImage!,
                                title: controller.listArticles[index].title!,
                                desc:
                                    controller.listArticles[index].description!,
                                date:
                                    controller.listArticles[index].publishedAt!,
                                onTap: () {
                                  Get.toNamed(Routes.NEWS_DETAIL,
                                      arguments: webUrl);
                                },
                              );
                            }),
                          ),
                        ),
                      );
          })
        ],
      ),
    );
  }
}
