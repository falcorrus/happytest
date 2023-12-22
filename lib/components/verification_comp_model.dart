import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verification_comp_widget.dart' show VerificationCompWidget;
import 'package:flutter/material.dart';

class VerificationCompModel extends FlutterFlowModel<VerificationCompWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (order)] action in Button widget.
  ApiCallResponse? apiResultOfVerif;
  // Stores action output result for [Backend Call - API (status)] action in Button widget.
  ApiCallResponse? apiSetStatusDenied;
  // Stores action output result for [Backend Call - API (status)] action in Button widget.
  ApiCallResponse? apiSetStatusDeniedCopy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
