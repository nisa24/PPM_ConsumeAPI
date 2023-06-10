import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_application_1/pages/home_page.dart';
=======
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/post_page.dart';
>>>>>>> vini
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = "home";
<<<<<<< HEAD
=======
  static const post = "post";
>>>>>>> vini

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomePage(),
    );
  }
<<<<<<< HEAD
=======
  static Page _postPageBuilder(BuildContext context, GoRouterState state) {
    return  MaterialPage(
      child: PostPage(
        post: state.extra as Post,
      ),
    );
  }
>>>>>>> vini

  static GoRouter goRouter = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homePageBuilder,
<<<<<<< HEAD
=======
        routes: [
          GoRoute(
            name: post,
            path: "post",
            pageBuilder: _postPageBuilder,
            ), 
        ]
>>>>>>> vini
      ),
    ],
  );
}
