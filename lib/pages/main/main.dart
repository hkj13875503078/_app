// ignore_for_file: unused_field, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_element, use_build_context_synchronously, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/common/apis/apis.dart';
import 'package:news_app/common/entitys/entitys.dart';
import 'package:news_app/common/utils/utils.dart';
import 'package:news_app/common/values/values.dart';
import 'package:news_app/common/widgets/widgets.dart';
import 'package:news_app/pages/main/ad_widget.dart';
import 'package:news_app/pages/main/categories_widget.dart';
import 'package:news_app/pages/main/channels_widget.dart';
import 'package:news_app/pages/main/news_item_widget.dart';
import 'package:news_app/pages/main/newsletter_widget.dart';
import 'package:news_app/pages/main/recommend_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController _controller = EasyRefreshController(); // EasyRefresh控制器

  NewsPageListResponseEntity? _newsPageList; // 新闻翻页
  NewsItem? _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity>? _categories; // 分类
  List<ChannelResponseEntity>? _channels; // 频道

  String? _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  // 如果有磁盘缓存，延迟3秒拉取更新档案
  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 1), () {
          _controller.callRefresh();
        });
      }
    }
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      context: context,
      cacheDisk: true,
    );
    _channels = await NewsAPI.channels(
      context: context,
      cacheDisk: true,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      cacheDisk: true,
    );

    _selCategoryCode = _categories!.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 拉取推荐、新闻
  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              setState(() {
                _loadNewsData(item.code);
                //_selCategoryCode = item.code;
              });
            },
          );
  }
  // 抽取前先实现业务
  // Widget _buildCategories() {
  //   return _categories == null
  //       ? Container()
  //       : SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             children: _categories.map<Widget>((item) {
  //               return Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 8),
  //                 child: GestureDetector(
  //                   child: Text(
  //                     item.title,
  //                     style: TextStyle(
  //                       color: _selCategoryCode == item.code
  //                           ? AppColors.secondaryElementText
  //                           : AppColors.primaryText,
  //                       fontSize: duSetFontSize(18),
  //                       fontFamily: 'Montserrat',
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                   onTap: () {
  //                     setState(() {
  //                       _selCategoryCode = item.code;
  //                     });
  //                   },
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         );
  // }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null // 数据没到位，可以用骨架图展示
        ? Container()
        : recommendWidget(_newsRecommend!, context);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
            channels: _channels,
            onTap: (ChannelResponseEntity item) {},
          );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : Column(
            children: _newsPageList!.items!.map((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                newsItem(item),
                Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = _newsPageList!.items!.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  adWidget(),
                  Divider(height: 1),
                ]);
              }

              return Column(
                children: widgets,
              );
            }).toList(),
          );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _newsPageList == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(),
            onRefresh: () async {
              await _loadNewsData(
                _selCategoryCode,
                refresh: true,
              );
              _controller.finishRefresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildCategories(),
                  Divider(height: 1),
                  _buildRecommend(),
                  Divider(height: 1),
                  _buildChannels(),
                  Divider(height: 1),
                  _buildNewsList(),
                  Divider(height: 1),
                  _buildEmailSubscribe(),
                ],
              ),
            ),
          );
  }
}
