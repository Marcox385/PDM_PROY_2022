import 'package:dental385/Pages/Personal/Home/MainPersonal.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class FireLoginPersonal extends StatelessWidget {
  const FireLoginPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignInScreen(
            showAuthActionSwitch: false,
            headerBuilder: (context, constraints, breakpoint) {
              return Center(
                  child: Column(
                children: [
                  SizedBox(height: 14.0),
                  Image.asset('assets/app_icon.png', height: 120),
                  Text('DENTAL385')
                ],
              ));
            },
            providerConfigs: [
          EmailProviderConfiguration()
        ],
            actions: [
          AuthStateChangeAction<SignedIn>(((context, state) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MainPersonal()),
                (route) => false);
          }))
        ]));
  }
}
