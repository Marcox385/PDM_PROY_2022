import 'package:flutter/material.dart';

class CitasPersonal extends StatelessWidget {
  const CitasPersonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 101, 44, 179),
          title: const Text('Citas'),
        ),
        body: Column(
          children: [
            Text(
              "9:00 AM",
              style: TextStyle(fontSize: 24),
            ),
            Divider(),
            Text("10:00 AM", style: TextStyle(fontSize: 24)),
            Divider()
          ],
        ));
  }
}
