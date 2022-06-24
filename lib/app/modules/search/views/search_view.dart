import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_danafix/app/modules/widgets/card_list_widget.dart';
import 'package:technicaltest_danafix/app/modules/widgets/search_with_back_button.dart';
import 'package:technicaltest_danafix/app/routes/app_pages.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetWidget<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWithBackButton(
              onTapBackButton: () => Get.back(),
              controller: controller,
              searchTextEditingC: controller.searchC),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'All News',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Obx(() {
            return (controller.loadingState == LoadingState.loading)
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                : (controller.listArticles == 0)
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
                            itemBuilder: ((context, index) => CardListWidget(
                                  image: controller
                                          .listArticles[index].urlToImage ??
                                      "https://miro.medium.com/max/1150/1*mJxChu066YXfKhJoHRr0Bw.jpeg",
                                  title: controller.listArticles[index].title ??
                                      '-',
                                  desc: controller
                                          .listArticles[index].description ??
                                      '-',
                                  date: controller
                                      .listArticles[index].publishedAt!, onTap: () {
                                    Get.toNamed(Routes.NEWS_DETAIL);
                            },
                                )),
                          ),
                        ),
                      );
          })
        ],
      )),
    );
  }
}
