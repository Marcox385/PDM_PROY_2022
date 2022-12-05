import 'package:dental385/Pages/Personal/Misc/CalendarioPersonal.dart';
import 'package:dental385/Pages/Personal/personal_service.dart';
import 'package:dental385/Pages/Personal/Misc/CitasPersonal.dart';
import 'package:dental385/Pages/Personal/QR/qr_personal.dart';
import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';

class MainPersonal extends StatelessWidget {
  PersonalService service = PersonalService();
  MainPersonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorPersonal,
          title: const Text('Bienvenid@ {{nombre de personal}}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Ver citas pendientes",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          primary: Theme.of(context).canvasColor,
                          side: BorderSide(width: 1.0, color: Colors.grey)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CitasPersonal()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Ver calendario",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          primary: Theme.of(context).canvasColor,
                          side: BorderSide(width: 1.0, color: Colors.grey)),
                      onPressed: () async {
                        List highs = await service.personalGetAllCitasParsed();
                        List<DateTime> listDates = List<DateTime>.from(highs.map((date) => date));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CalendarioPersonal(toHighlight: listDates)));
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.qr_code_2),
                    iconSize: 150,
                    tooltip: 'Leer QR',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRPersonal()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text('Lector de QR',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
