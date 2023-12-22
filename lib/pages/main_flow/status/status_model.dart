import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'status_widget.dart' show StatusWidget;
import 'package:flutter/material.dart';

class StatusModel extends FlutterFlowModel<StatusWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (status)] action in Row-transMeeting widget.
  ApiCallResponse? apiResulteqs;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Row-noContact widget.
  ApiCallResponse? apiResultkl5;

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
