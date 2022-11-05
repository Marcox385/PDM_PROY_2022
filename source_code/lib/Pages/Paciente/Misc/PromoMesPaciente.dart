import 'package:flutter/material.dart';

class PromoMesPaciente extends StatelessWidget {
  const PromoMesPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 155, 240),
          title: const Text('Promos del mes'),
        ),
        body: Column(children: [
          PromoComponent(),
          Divider(
            thickness: 2,
          ),
          PromoComponent(),
          Divider(
            thickness: 2,
          )
        ]));
  }
}

class PromoComponent extends StatelessWidget {
  const PromoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.access_alarm, size: 40),
      ),
      Column(
        children: [
          Text("PromoName", style: TextStyle(fontSize: 24)),
          Text("Brief description", style: TextStyle(color: Colors.grey)),
        ],
      )
    ]);
  }
}