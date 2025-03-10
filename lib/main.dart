import 'package:flutter/material.dart';
import 'package:learn_provider_1/provider/auth_provider.dart';
import 'package:learn_provider_1/provider/count_provider.dart';
import 'package:learn_provider_1/provider/example_one_provider.dart';
import 'package:learn_provider_1/provider/favourite_provider.dart';
import 'package:learn_provider_1/provider/theme_changer_provider.dart';
import 'package:learn_provider_1/screens/favourite/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: Colors.purple,
              brightness: Brightness.dark,
            ),
            home: LoginScreen(),
          );
        }));
  }
}
