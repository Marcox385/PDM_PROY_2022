
import 'package:flutter/material.dart';

class MainPersonal extends StatelessWidget {
  const MainPersonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 101, 44, 179),
          title: const Text('Bienvenid@ {{nombre de personal}}'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                child: Text("Ver citas pendientes"),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                child: Text("Ver calendario"),
                onPressed: () {},
              ),
            ),
            Container(
              height: 350,
            ),
            SizedBox(
              width: double.infinity,
              child: IconButton(
                icon: Icon(Icons.qr_code),
                iconSize: 100,
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
