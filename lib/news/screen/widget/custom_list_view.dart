import 'package:flutter/material.dart';
import 'package:newsapp/news/data/model/news_model/news_model.dart';
import 'package:newsapp/news/screen/widget/news_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.newsModel});
  final List<NewsModel>newsModel;
  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
      itemCount:newsModel.length,
      itemBuilder: (context,index)=>NewsItem(newsModel: newsModel[index],),
    );
  }
}