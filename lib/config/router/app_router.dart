import 'package:go_router/go_router.dart';
import 'package:prueba_login/presentation/screens/home/home_screen.dart';
import 'package:prueba_login/presentation/screens/other_screen/other_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name:'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/other',
      name:'other',
      builder: (context, state) => const OtherScreen(),
    ),
  ],
);