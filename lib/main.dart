import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:haq_wt_u_nd_2_know/Pages/home_page.dart';
import 'package:haq_wt_u_nd_2_know/provider/common_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommonProvider(),
      child: MaterialApp.router(
        title: 'Haq what U need 2 know',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _goRouter,
      ),
    );
  }
}

final GoRouter _goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'Skills',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
        ),
      ],
    ),
  ],
);
