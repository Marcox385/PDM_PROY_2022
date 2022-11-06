import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:dental385/secrets.dart';

import '../home_page.dart';

class FormBodyFirebase extends StatelessWidget {
  const FormBodyFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignInScreen(
            showAuthActionSwitch: false,
            headerBuilder: (context, constraints, breakpoint) {
              return Center(child: Image.asset('assets/app_icon.png', height: 120));
            },
            providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(clientId: GOOGLE_CLIENT_ID)
            ],
            footerBuilder: (context, action) {
              return Text(
                  'Al entrar a la aplicación, aceptas nuestro términos y condiciones.');
            },
            actions: [
              AuthStateChangeAction<SignedIn>(((context, state) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }))
            ]));
  }
}
