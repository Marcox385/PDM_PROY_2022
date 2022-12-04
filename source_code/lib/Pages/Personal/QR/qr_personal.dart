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

  bool enabled = false;

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
                icon: Icon((enabled) ? Icons.visibility : Icons.visibility_off),
                onPressed: () async {
                  if (enabled)
                    await controller?.pauseCamera();
                  else
                    await controller?.resumeCamera();

                  enabled = !enabled;
                  setState(() {});
                }),
            IconButton(
                icon: Icon(Icons.cameraswitch),
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 11, child: _buildQrView(context)),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: (!enabled)
                      ? Text('Cámara deshabilitada')
                      : (result == null)
                          ? Text('Escaneando...')
                          : Text('Ver datos'),
                  style: ElevatedButton.styleFrom(
                      primary: (result == null)
                          ? Colors.grey
                          : primaryColorPersonal),
                  onPressed: (result == null)
                      ? null
                      : (() async {
                          if (result != null) {
                            await controller?.pauseCamera();
                            enabled = false;
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    QRResults(raw_data: result!.code!)));
                            result = null;
                            setState(() {});
                          }
                        }),
                ))
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
