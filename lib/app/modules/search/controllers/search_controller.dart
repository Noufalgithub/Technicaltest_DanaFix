import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_danafix/app/data/models/search/model_news_everything.dart';
import 'package:technicaltest_danafix/app/data/repository/search/search_repo.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';

class SearchController extends GetxController {
  Rx<LoadingState> loadingState = LoadingState.loading.obs;
  Rx<int> limit = 10.obs;
  TextEditingController searchC = TextEditingController();
  Rx<RefreshController> refreshController =
      RefreshController(initialRefresh: false).obs;
  var listArticles = List<Articles>.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    print('ini onInit');
    getNewsEverything();
    super.onInit();
  }

  void pagination() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (limit.value == listArticles.length) {
    } else {
      limit.value += 10;
      if (limit.value >= listArticles.length) {
        limit.value = listArticles.length;
        refreshController.value.loadComplete();
      }
    }
    refreshController.value.loadComplete();
  }

  void getNewsEverything({String keyword = 'corona'}) async {
    await SearchRepo().getNewsEverything(keyword: keyword).then((value) {
      listArticles(value.articles);
      loadingState(LoadingState.loaded);
    });
  }
}
