import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_login/presentation/provider/provider.dart';
import 'package:prueba_login/services/firebase_service.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textControlUser = TextEditingController();

  final TextEditingController textControlPassword = TextEditingController();
  bool isLoading = false;
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
              icon: const Icon(Icons.navigate_next_outlined)),
              IconButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = FirebaseService();
                try {
                await service.signInwithGoogle();
                context.goNamed("other");
                } catch(e){
                  if(e is FirebaseAuthException){
                    showMessage(e.message!);
                  }
                }
                setState(() {
                  isLoading = false;
                });
              }, 
              icon: const FaIcon(FontAwesomeIcons.google))
          ],
        ),
    );
  }
void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
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
