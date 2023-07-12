import 'dart:convert';
import 'dart:io';

import 'package:betweener_app/core/widgets/text_widget.dart';
import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/feature/links/presentation/screens/profile_screen.dart';
import 'package:betweener_app/feature/share/presentation/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;
  @override
  void initState() {
    super.initState();
    controller?.resumeCamera();
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.black,
        body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if(result!=null){
      print('----------+++++++++++++++++++++++++++++++++-------------');
      Map<String, dynamic> data = jsonDecode(result!.code.toString());
      UserModel userModel = UserModel.fromJson(data);
      Navigator.pop(context);
      print(userModel);

      print('----------+++++++++++++++++++++++++++++++++-------------');
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: HomePage()), (route) => false);
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          TextWidget(
            text: 'Scan your QR Code',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.sp,
          ),
          SizedBox(height: 20.h),
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderRadius: 10, borderWidth: 5, borderColor: Colors.white),

            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result?.code}',style: TextStyle(
                color: Colors.blue
              ),)
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios)),
      iconTheme: IconThemeData(
        color: Colors.white
      ),

    );
  }
  navigatorPop(BuildContext context){
    Navigator.pop(context);
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

      });
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
