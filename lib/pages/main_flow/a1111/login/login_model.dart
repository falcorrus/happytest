import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

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
  ApiCallResponse? apiLogin;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldPasswordVisibility = false;
  }

  @override
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
