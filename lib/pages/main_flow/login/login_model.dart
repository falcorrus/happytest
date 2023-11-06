import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField-mail widget.
  FocusNode? textFieldMailFocusNode;
  TextEditingController? textFieldMailController;
  String? Function(BuildContext, String?)? textFieldMailControllerValidator;
  // State field(s) for TextField-password widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)? textFieldPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (login)] action in Button widget.
  ApiCallResponse? loginResult;
  // Stores action output result for [Backend Call - API (login)] action in Button widget.
  ApiCallResponse? apiResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldPasswordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldMailFocusNode?.dispose();
    textFieldMailController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
