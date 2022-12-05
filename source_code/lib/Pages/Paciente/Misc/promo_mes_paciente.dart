import 'package:dental385/Pages/Paciente/pacient_service.dart';
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
        body: FutureBuilder(
            future: PacientService().getPromos(),
            builder: ((context, data) {
              if (!data.hasData)
                return Center(child: CircularProgressIndicator());

              var promoList = data.data as List<Map>;

              if (promoList.length == 0) return Center(
                    child: Text('No hay promociones disponibles al momento'));

              return ListView.builder(
                itemCount: promoList.length,
                itemBuilder: ((context, index) {
                  dynamic curr_item = promoList[index];

                  return _promoItem(context, curr_item['titulo'],
                      curr_item['desc'], curr_item['tipo']);
                }),
              );
            })));
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

    return Card(
      child: ListTile(
        leading: Icon(icon, color: color, size: 40.0),
        title: Text(promoName, style: TextStyle(fontSize: 24)),
        subtitle: Text(description, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
