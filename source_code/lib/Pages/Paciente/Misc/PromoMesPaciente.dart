import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PromoMesPaciente extends StatelessWidget {
  const PromoMesPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Promos del mes'),
        ),
        body: Column(children: [
          _promoItem(context, 'Promo', 'Promoción del mes', 0),
          Divider(
            thickness: 2,
          ),
          _promoItem(context, 'Descuento', 'Mega descuento', 1),
          Divider(
            thickness: 2,
          )
        ]));
  }

  Widget _promoItem(
      context, String promoName, String description, int promoType) {
    dynamic icon, color;

    switch (promoType) {
      case 0:
        icon = FontAwesomeIcons.tag;
        color = Colors.pink;
        break;
      case 1:
        icon = FontAwesomeIcons.percent;
        color = Theme.of(context).primaryColor;
        break;
      default:
        icon = FontAwesomeIcons.gift;
        color = Colors.yellow;
    }

    Icon itemIcon = Icon(
        icon, color: color, size: 40.0);

    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: itemIcon,
      ),
      Column(
        children: [
          Text(promoName, style: TextStyle(fontSize: 24)),
          Text(description, style: TextStyle(color: Colors.grey)),
        ],
      )
    ]);
  }
}
