import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_widget.dart' show OrderWidget;
import 'package:flutter/material.dart';

class OrderModel extends FlutterFlowModel<OrderWidget> {
  ///  Local state fields for this page.

  int? prodslug;

  String? nextSl;

  int? nextSo;

  bool? isPersonalPS;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (status)] action in Button widget.
  ApiCallResponse? apiStatus;
  // Stores action output result for [Backend Call - API (order)] action in Button widget.
  ApiCallResponse? apiOrder;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Button widget.
  ApiCallResponse? apiResultProduct2;
  // Stores action output result for [Backend Call - API (status)] action in Button widget.
  ApiCallResponse? apiResultntr;
  // Stores action output result for [Backend Call - API (status)] action in Button widget.
  ApiCallResponse? apiStat;

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
