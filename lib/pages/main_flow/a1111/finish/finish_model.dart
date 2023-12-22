import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'finish_widget.dart' show FinishWidget;
import 'package:flutter/material.dart';

class FinishModel extends FlutterFlowModel<FinishWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (order)] action in Button-more widget.
  ApiCallResponse? order;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
