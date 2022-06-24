import 'package:dio/dio.dart';
import 'package:technicaltest_danafix/app/data/models/home/model_topheadlines_espn.dart';
import 'package:technicaltest_danafix/app/utils/my_string.dart';
import 'package:technicaltest_danafix/app/utils/network/base_dio.dart';

class HomeRepo extends BaseDio {
  Future<ModelTopheadlinesEspn> getNewsTopHeadlines() async {
    try {
      response = await dio.get(
        MyString.topHeadlines,
        queryParameters: {'apiKey': MyString.apiKey, 'sources': 'ESPN'},
      );
      return ModelTopheadlinesEspn.fromJson(response!.data);
    } on DioError catch (e) {
      print(e);
      return throw Exception();
    }
  }
}
