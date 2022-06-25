import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_danafix/app/data/models/home/model_topheadlines_espn.dart';
import 'package:technicaltest_danafix/app/data/repository/home/home_repo.dart';
import 'package:technicaltest_danafix/app/modules/widgets/dialog/dialog_snackbar.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';
import 'package:technicaltest_danafix/app/utils/my_string.dart';
import 'package:technicaltest_danafix/app/utils/network/connectivity_service.dart';

class HomeController extends GetxController {
  Rx<LoadingState> loadingState = LoadingState.loading.obs;
  Rx<int> limit = 10.obs;
  var listArticles = List<Articles>.empty().obs;
  Rx<RefreshController> refreshController =
      RefreshController(initialRefresh: false).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getNewsTopHeadlines();
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

  void getNewsTopHeadlines() async {
    ConnectivityService().checkConnection().then((value) async {
      if (value == ConnectivityResult.none) {
        return showSnackBar(
            snackBarType: SnackBarType.ERROR,
            title: 'No Internet',
            message: 'No internet connection.');
      } else {
        await HomeRepo().getNewsTopHeadlines().then((value) {
          listArticles(value.articles);
          loadingState(LoadingState.loaded);
        });
      }
    });
  }
}
