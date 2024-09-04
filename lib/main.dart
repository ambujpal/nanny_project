import 'package:flutter/material.dart';
import 'package:nany/provider/home_navigation_provider.dart';
import 'package:nany/provider/home_provider.dart';
import 'package:nany/utils/routes/app_routes.dart';
import 'package:nany/utils/routes/app_routes_name.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeNavigationProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutesName.homeNavigationScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
