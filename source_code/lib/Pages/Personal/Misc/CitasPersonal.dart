import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';

class CitasPersonal extends StatelessWidget {
  const CitasPersonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Divider _separator = Divider(height: 1.5);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorPersonal,
          title: const Text('Citas'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Text(
                "9:00 AM",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              _separator,
              Container(height: 50.0, color: Colors.grey[300]),
              _separator,
              Text("10:00 AM",
                  style: Theme.of(context).textTheme.headlineMedium),
              _separator,
              Container(height: 50.0, color: Colors.grey[300]),
              _separator
            ],
          ),
        ));
  }
}
