import 'package:dartz/dartz.dart';
import 'package:newsapp/news/data/model/news_model/news_model.dart';
import 'package:newsapp/util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,List<NewsModel>>>getNews({required String category,required String codeCountry});
}