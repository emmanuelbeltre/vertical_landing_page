import 'package:flutter/material.dart';
import 'package:vertical_landing_page/router/router.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/home',
      onGenerateRoute: (routeSettings) =>
          Flurorouter.router.generator(routeSettings),
    );
  }
}
