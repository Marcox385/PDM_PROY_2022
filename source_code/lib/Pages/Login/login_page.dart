import 'package:dental385/Pages/Login/form_body_firebase.dart';
import 'package:dental385/Pages/Login/form_body_firebase_user.dart';
import 'package:dental385/Pages/Login/pacient_login_service.dart';
import 'package:dental385/Pages/home_page.dart';
import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/logo_font.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundedButton(FontAwesomeIcons.tooth, 'Paciente', true, context),
              RoundedButton(
                  FontAwesomeIcons.clipboardUser, 'Personal', false, context)
            ],
          )
        ],
      ),
    ));
  }

  Widget RoundedButton(dynamic icon, String text, bool isMain, context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width / 2.25,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,
                size: 100.0,
                color: isMain ? primaryColorPaciente : primaryColorPersonal),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      onTap: () {
        if (isMain) {
          // AuthService().signInWithGoogle();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormBodyFirebaseUser()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormBodyFirebase()));
        }
      },
    );
  }
}
