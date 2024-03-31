import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/main.dart';

class ScanQR extends StatefulWidget {
  final data;
  const ScanQR({super.key, required this.data});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>QRCodeScannerScreen()), (route) => false);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
   body: Center(
     child: Column(
       children: [
         Text(widget.data,style: TextStyle(fontSize: 30),),
         SizedBox(height: 20,),
         ElevatedButton(onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>QRCodeScannerScreen()), (route) => false); }, child: Text('Back'))
       ],
     ),
   ),
    );
  }
}
