
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/qrcode.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QRCodeScannerScreen(),
    );
  }
}
class QRCodeScannerScreen extends StatefulWidget {
  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {

  final GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;
  Barcode? result;
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: _buildQrView(context));
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 20,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: 300,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData)async {
      setState(() {
        result = scanData;
        print(result!.code);
        controller.stopCamera(); // Stop the camera after scanning
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => ScanQR(data: 'data : ${result!.code.toString()}'),
        ),);
      });
    });

  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

}
