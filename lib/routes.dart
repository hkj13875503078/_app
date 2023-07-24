// ignore_for_file: prefer_const_constructors
import 'package:news_app/pages/application/application.dart';
import 'package:news_app/pages/sign_in/sign_in.dart';
import 'package:news_app/pages/sign_up/sign_up.dart';

/// 静态路由
var staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(), // 主程序
};
