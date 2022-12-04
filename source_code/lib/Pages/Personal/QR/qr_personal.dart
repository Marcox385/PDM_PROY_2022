import 'package:dental385/Pages/Personal/QR/qr_results.dart';
import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRPersonal extends StatefulWidget {
  const QRPersonal({super.key});

  @override
  State<QRPersonal> createState() => _QRPersonalState();
}

class _QRPersonalState extends State<QRPersonal> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorPersonal,
          title: const Text('Lector QR'),
          actions: [
            IconButton(
                icon: Icon(Icons.cameraswitch),
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                })
          ],
        ),
        body: Column(
          children: [
            Expanded(flex: 6, child: _buildQrView(context)),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // if (result == null)
                    //   const Text('Escaneando...')
                    // else
                    //   Text(
                    //       'Tipo: ${describeEnum(result!.format)}  Resultados: ${result!.code}')

                    ElevatedButton(
                      child: (result == null) ? Text('Escaneando...') : Text('Ver datos'),
                      onPressed: (() {
                        if (result != null) 
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRResults()));
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 175.0
        : 350.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: primaryColorPersonal,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
