import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/home_page',
  routes: <RouteBase>[
    GoRoute(
      path: '/home_page',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}