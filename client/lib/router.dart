import 'package:client/pages/home_page.dart';
import 'package:client/pages/initial_loading_page.dart';
import 'package:client/pages/register_page.dart';
import 'package:client/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  final authStore = ref.read(authStoreProvider);
  final router = GoRouter(
      initialLocation: "/home",
      refreshListenable: authStore,
      routes: [
        GoRoute(
            path: "/splash",
            pageBuilder: (context, state) {
              return const MaterialPage(child: InitialLoadingPage());
            }),
        GoRoute(
            path: "/home",
            pageBuilder: (context, state) {
              return const MaterialPage(child: HomePage());
            }),
        GoRoute(
            path: "/register",
            pageBuilder: (context, state) {
              return const MaterialPage(child: RegisterPage());
            }),
      ],
      redirect: (context, state) {
        if (state.subloc != "/splash" && authStore.type == AuthStateType.loading) {
          return "/splash";
        }
        if (state.subloc != "/register" &&
            authStore.type == AuthStateType.unauthorized) {
          return "/register";
        }
        if (state.subloc == "/splash" && authStore.type != AuthStateType.loading) {
          return "/home";
        }
        return null;
      });
  return router;
});
