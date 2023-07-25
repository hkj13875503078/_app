// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_final_fields, sized_box_for_whitespace, unused_field, unused_element, unnecessary_null_comparison, avoid_print, unused_label

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/entitys/news.dart';
import 'package:news_app/common/values/values.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  final NewsItem? item;
  DetailsPage({Key? key, this.item}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _webViewHeight = 200;
  final WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      // 注册js回调
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _getWebViewHeight();
          },
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..addJavaScriptChannel(
        'Invoke',
        onMessageReceived: (JavaScriptMessage message) {
          print(message.message);
          var webHeight = double.parse(message.message);
          if (webHeight != null) {
            setState(() {
              _webViewHeight = webHeight;
            });
          }
        },
      )
      ..loadRequest(
          Uri.parse('$SERVER_API_URL/news/content/${widget.item!.id}'));
  }

  // 顶部导航
  PreferredSizeWidget _buildAppBar() {
    return AppBar();
  }

// 页标题
  Widget _buildPageTitle() {
    return Container();
  }

// 页头部
  Widget _buildPageHeader() {
    return Container();
  }

// web内容
  Widget _buildWebView() {
    return Container(
      height: _webViewHeight,
      child: WebViewWidget(
        controller: controller,
      ),
      //     initialUrl: '$SERVER_API_URL/news/content/1', //widget.url,
      //     javascriptMode: JavascriptMode.unrestricted,
      //     onWebViewCreated: (WebViewController webViewController) async {
      //       _controller.complete(webViewController);
      //     },
      //     gestureNavigationEnabled: true,
      //   ),
    );
  }

  // 删除广告
  _removeWebViewAd() async {
    await controller.runJavaScript('''
        try {
          function removeElement(elementName){
            let _element = document.getElementById(elementName);
            if(!_element) {
              _element = document.querySelector(elementName);
            }
            if(!_element) {
              return;
            }
            let _parentElement = _element.parentNode;
            if(_parentElement){
                _parentElement.removeChild(_element);
            }
          }

          removeElement('module-engadget-deeplink-top-ad');
          removeElement('module-engadget-deeplink-streams');
          removeElement('footer');
        } catch{}
        ''');
  }

  // 获取页面高度
  _getWebViewHeight() async {
    await controller.runJavaScript('''
        try {
          // Invoke.postMessage([document.body.clientHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight]);
          let scrollHeight = document.documentElement.scrollHeight;
          if (scrollHeight) {
            Invoke.postMessage(scrollHeight);
          }
        } catch {}
        ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildPageTitle(),
            Divider(height: 1),
            _buildPageHeader(),
            _buildWebView(),
          ],
        ),
      ),
    );
  }
}
