import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_login/presentation/provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final TextEditingController textControlUser = TextEditingController();
  final TextEditingController textControlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: _CustomFieldBox(textControl: textControlUser, label: "User",)
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: _CustomFieldBox(textControl: textControlPassword, label: "Password",),
            ),
            IconButton(
              onPressed: () {
                
                if(provider.login(textControlUser.text, textControlPassword.text)){
                  context.go("/other");
                }else{
                  showDialog(
                    context: context, 
                    builder:(context) => const AlertDialog(
                      content: Text("Usuario y contraseña incorrectos")

                    ),
                  );
                }
              }, 
              icon: const Icon(Icons.navigate_next_outlined))
          ],
        ),
    );
  }
}

class _CustomFieldBox extends StatelessWidget {

  final TextEditingController textControl;

  final String label;

  const _CustomFieldBox({super.key, required this.textControl, required this.label});

  @override
  Widget build(BuildContext context) {

    final focusNode = FocusNode();
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label 
      ),
      onTapOutside: (event) {

        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textControl,
    );
  }
}
