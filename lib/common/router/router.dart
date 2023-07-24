// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/pages/application/application.dart';
import 'package:news_app/pages/details/details.dart';
import 'package:news_app/pages/index/index.dart';
import 'package:news_app/pages/sign_in/sign_in.dart';
import 'package:news_app/pages/sign_up/sign_up.dart';
import 'package:news_app/pages/welcome/welcome.dart';
part 'router.gr.dart';

// @MaterialRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     AutoRoute(page: IndexPage, initial: true),
//     AutoRoute(page: WelcomePage),
//     AutoRoute(page: SignInPage),
//     AutoRoute(page: SignUpPage),
//     AutoRoute(page: ApplicationPage),
//     AutoRoute(page: DetailsPage),
//   ],
// )
// class AppRouter {}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter {
  @override
  RouteType get defaultRouteType =>
      RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: IndexRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ApplicationRoute.page),
        AutoRoute(page: DetailsRoute.page),
      ];
}
