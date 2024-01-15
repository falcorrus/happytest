import '/backend/api_requests/api_calls.dart';
import '/components/row_back_back/row_back_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_s_m_s_widget.dart' show LoginSMSWidget;
import 'package:flutter/material.dart';

class LoginSMSModel extends FlutterFlowModel<LoginSMSWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  String? tel;

  String cr = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_BackBack component.
  late RowBackBackModel rowBackBackModel;
  // State field(s) for TextField-sms widget.
  FocusNode? textFieldSmsFocusNode;
  TextEditingController? textFieldSmsController;
  String? Function(BuildContext, String?)? textFieldSmsControllerValidator;
  // Stores action output result for [Backend Call - API (loginCode)] action in Button-more widget.
  ApiCallResponse? apiLoginCode;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackBackModel = createModel(context, () => RowBackBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackBackModel.dispose();
    textFieldSmsFocusNode?.dispose();
    textFieldSmsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
