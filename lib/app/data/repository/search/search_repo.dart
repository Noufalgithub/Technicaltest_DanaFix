import 'package:dio/dio.dart';
import 'package:technicaltest_danafix/app/data/models/home/model_topheadlines_espn.dart';
import 'package:technicaltest_danafix/app/data/models/search/model_news_everything.dart';
import 'package:technicaltest_danafix/app/utils/my_string.dart';
import 'package:technicaltest_danafix/app/utils/network/base_dio.dart';

class SearchRepo extends BaseDio {
  Future<ModelNewsEverything> getNewsEverything({String? keyword}) async {
    try {
      response = await dio.get(
        MyString.everything,
        queryParameters: {'apiKey': MyString.apiKey, 'q': keyword},
      );
      return ModelNewsEverything.fromJson(response!.data);
    } on DioError catch (e) {
      print(e);
      return throw Exception();
    }
  }
}
