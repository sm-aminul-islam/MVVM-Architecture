import 'package:flutter/material.dart';
import 'package:mvvm/uitil/routes/routes.dart';
import 'package:mvvm/uitil/routes/routes_name.dart';
import 'package:mvvm/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.genarateRoute,
    );
  }
}
