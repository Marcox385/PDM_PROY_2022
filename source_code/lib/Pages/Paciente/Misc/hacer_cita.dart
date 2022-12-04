import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HacerCita extends StatelessWidget {
  const HacerCita({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contacto directo:'),
              TextButton(
                  child: Text('33-2850-3259'),
                  onPressed: () async {
                    if (!await launchUrl(
                        Uri(scheme: 'tel', path: '3328503259')))
                      throw 'No es posible realizar llamadas en este dispositivo...';
                  }),
              Icon(Icons.phone)
            ],
          )
        ],
      ),
    );
  }
}
