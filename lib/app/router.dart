import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/views/app_view.dart';
import 'package:rickandmorty_app/views/screens/characters_view/characters_view.dart';
import 'package:rickandmorty_app/views/screens/episodes_view/episodes_view.dart';
import 'package:rickandmorty_app/views/screens/favorites_view/favorites_view.dart';
import 'package:rickandmorty_app/views/screens/locations_view/locations_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();
  static const String characters = '/characters';
  static const String favorites = '/favorites';
  static const String locations = '/locations';
  static const String episodes = '/episodes';
}

final router = GoRouter(
  initialLocation: AppRoutes.characters,
  navigatorKey: _routerKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder: (context, state) => const CharactersView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => const LocationsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.episodes,
              builder: (context, state) => const EpisodesView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
