import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_login/config/router/app_router.dart';
import 'package:prueba_login/config/theme/app_theme.dart';
import 'package:prueba_login/firebase_options.dart';
import 'package:prueba_login/presentation/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider() )
      ],
      child: MaterialApp.router(
        title: 'Prueba login',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
      )
    );
  }
}