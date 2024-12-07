import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/news/data/model/news_model/news_model.dart';
import 'package:newsapp/news/data/repo/home_repo.dart';
import 'package:newsapp/util/api_service.dart';
import 'package:newsapp/util/app_const.dart';
import 'package:newsapp/util/error.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImple(this._apiService);

  @override
  Future<Either<Failuer, List<NewsModel>>> getNews({required String category,required String codeCountry}) async {
    try {
      var response = await _apiService.get(
        method: AppConst.method,
        query: {
          'country': codeCountry,
          'category': category,
          'apiKey': AppConst.apiKey
        },
      );
      List<dynamic> data = response.data['articles'];
      List<NewsModel> newsModel =
          data.map((e) => NewsModel.fromJson(e)).toList();
      return right(newsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromdioerror(e));
      } else {
        return left(
          ServerFailuer(
            e.toString(),
          ),
        );
      }
    }
  }
}
