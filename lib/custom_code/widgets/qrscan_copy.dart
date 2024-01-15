// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_animate/flutter_animate.dart';

import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class Qrscan extends StatefulWidget {
  const Qrscan({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  _QrscanState createState() => _QrscanState();
}

class _QrscanState extends State<Qrscan> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () {
          _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
            context: context,
            onCode: (code) {
              setState(() {
                this.code = code;
              });

              // Проверка на null перед обновлением значения
              String codeResult = this.code ?? "";

              // Broz добавил назначение переменных в FF
              FFAppState().update(() {
                FFAppState().scanAS = codeResult.substring(15);
                FFAppState().IsScanBack = true;
              });
            },
          );
        },
        child: Text(
          "СКАНИРОВАТЬ",
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Montserrat',
                color: Color(0xFF5F5F5F),
                fontSize: 12,
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
                lineHeight: 1.5,
              ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(327, 48),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0xFFEAEAEA),
          // backgroundColor: FlutterFlowTheme.of(context).accent4,
          // primary: Colors.accent4,
          elevation: 0,
        ),
      ),
    );
  }
}
