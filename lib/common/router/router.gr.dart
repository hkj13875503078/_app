// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInPage(key: args.key),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () => const DetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsPage(
          key: args.key,
          item: args.item,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
    IndexRoute.name: (routeData) {
      final args = routeData.argsAs<IndexRouteArgs>(
          orElse: () => const IndexRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IndexPage(key: args.key),
      );
    },
    ApplicationRoute.name: (routeData) {
      final args = routeData.argsAs<ApplicationRouteArgs>(
          orElse: () => const ApplicationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ApplicationPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    Key? key,
    NewsItem? item,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<DetailsRouteArgs> page =
      PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    this.item,
  });

  final Key? key;

  final NewsItem? item;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IndexPage]
class IndexRoute extends PageRouteInfo<IndexRouteArgs> {
  IndexRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          IndexRoute.name,
          args: IndexRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'IndexRoute';

  static const PageInfo<IndexRouteArgs> page = PageInfo<IndexRouteArgs>(name);
}

class IndexRouteArgs {
  const IndexRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'IndexRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ApplicationPage]
class ApplicationRoute extends PageRouteInfo<ApplicationRouteArgs> {
  ApplicationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ApplicationRoute.name,
          args: ApplicationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static const PageInfo<ApplicationRouteArgs> page =
      PageInfo<ApplicationRouteArgs>(name);
}

class ApplicationRouteArgs {
  const ApplicationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ApplicationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<SignUpRouteArgs> page = PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}
