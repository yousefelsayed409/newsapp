import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/data/repo/home_repo_imple.dart';
import 'package:newsapp/news/manager/bottom_cubit/cubit/bottom_nav_bar_cubit.dart';
import 'package:newsapp/news/manager/cubit/news_cubit.dart';
import 'package:newsapp/news/manager/science_cubit/cubit/science_news_cubit.dart';
import 'package:newsapp/news/manager/sport_cubit/cubit/sport_news_cubit.dart';
import 'package:newsapp/news/screen/widget/custom_appbar.dart';
import 'package:newsapp/news/screen/widget/custom_bottom_nav_bar.dart';
import 'package:newsapp/util/service_locator.dart';

import 'widget/build_drwer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit(
                getIt.get<HomeRepoImple>(),
                )..gethNewsBuseniss(codeCountry: 'eg')),
        BlocProvider(
            create: (context) => ScienceNewsCubit(
               getIt.get<HomeRepoImple>(),
                )..gethNewsScience(codeCountry: 'eg')),
        BlocProvider(
            create: (context) => SportNewsCubit(
              getIt.get<HomeRepoImple>(),
                )..gethNewsSports(codeCountry: 'eg')),
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
      ],
      child: SafeArea(
        child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return Scaffold(
                drawer: const BuildDrawr(),
                appBar: const CustomAppBar(),
                body: BlocProvider.of<BottomNavBarCubit>(context).screen[BlocProvider.of<BottomNavBarCubit>(context).currntIndex],
                bottomNavigationBar: const CustomBottomNavBar());
          },
        ),
      ),
    );
  }
}
