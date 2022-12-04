import 'package:dental385/Pages/Login/pacient_service.dart';
import 'package:dental385/Pages/Paciente/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:dental385/secrets.dart';

class FireLoginPacient extends StatelessWidget {
  const FireLoginPacient({super.key});

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
          GoogleProviderConfiguration(clientId: GOOGLE_CLIENT_ID)
        ],
            actions: [
          AuthStateChangeAction<SignedIn>(((context, state) async {
            await PacientService().pacientLogin();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
          }))
        ]));
  }
}
