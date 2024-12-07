import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/shared_prefrence.dart';
import 'package:newsapp/util/api_service.dart';
import 'package:newsapp/util/bloc_observ.dart';
import 'package:newsapp/util/service_locator.dart';
import 'package:newsapp/news/manager/themcubit/cubit/them_app_cubit.dart';
import 'package:newsapp/them/dark_them.dart';
import 'package:newsapp/them/light_them.dart';
import 'package:newsapp/util/app_const.dart';
import 'package:newsapp/util/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = const AppBlocObserver();
setup();
 await MyChatSharedPrefrence.init();
  ApiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemAppCubit()
          ..getThem(
            themAppFromShared: MyChatSharedPrefrence.get(AppConst.themAppsp),
          ),
        child: BlocBuilder<ThemAppCubit, ThemAppState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightMode(),
              darkTheme: darkMode(),
              themeMode: BlocProvider.of<ThemAppCubit>(context).themApp == true
                  ? ThemeMode.light
                  : ThemeMode.dark,
              onGenerateRoute: AppRouter.generatRouter,
            );
          },
        ));
  }
}
