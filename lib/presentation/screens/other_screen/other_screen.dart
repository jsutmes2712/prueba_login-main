import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_login/presentation/provider/provider.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.user),
        actions: [
          IconButton(
            onPressed: () {
              context.go("/");
            },
            icon: const Icon(Icons.turn_left_sharp)
          )
        ],
      ),
      body: Container(),
    );
  }
}