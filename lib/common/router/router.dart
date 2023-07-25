// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/entitys/entitys.dart';
import 'package:news_app/common/router/auth_grard.dart';
import 'package:news_app/pages/application/application.dart';
import 'package:news_app/pages/details/details.dart';
import 'package:news_app/pages/index/index.dart';
import 'package:news_app/pages/sign_in/sign_in.dart';
import 'package:news_app/pages/sign_up/sign_up.dart';
import 'package:news_app/pages/welcome/welcome.dart';
part 'router.gr.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
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
        CustomRoute(
          page: DetailsRoute.page,
          guards: [AuthGuard()],
          transitionsBuilder: zoomInTransition,
        )
      ];
}
