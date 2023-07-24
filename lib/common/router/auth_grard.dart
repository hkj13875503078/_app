// ignore_for_file: use_build_context_synchronously, override_on_non_overriding_member

import 'package:auto_route/auto_route.dart';
import 'package:news_app/common/router/router.dart';
import 'package:news_app/common/utils/utils.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    var isAuth = await isAuthenticated();
    if (isAuth) {
      resolver.next(true);
    } else {
      resolver.redirect(SignInRoute());
    }
  }
}
