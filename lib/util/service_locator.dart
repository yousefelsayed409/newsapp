import 'package:get_it/get_it.dart';
import 'package:newsapp/news/data/repo/home_repo_imple.dart';
import 'package:newsapp/util/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepoImple>(HomeRepoImple(ApiService()));

}
