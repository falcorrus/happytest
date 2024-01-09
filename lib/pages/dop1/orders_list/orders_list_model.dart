import '/backend/api_requests/api_calls.dart';
import '/components/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_list_widget.dart' show OrdersListWidget;
import 'package:flutter/material.dart';

class OrdersListModel extends FlutterFlowModel<OrdersListWidget> {
  ///  Local state fields for this page.

  String? nextSlp;

  int? nextSop;

  String? pdf = '';

  bool? isWork = false;

  String today = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (user)] action in Text widget.
  ApiCallResponse? apiAgent;
  // Stores action output result for [Backend Call - API (Orders)] action in IconButton widget.
  ApiCallResponse? apiResultOrders;
  // Stores action output result for [Backend Call - API (order)] action in IconButton widget.
  ApiCallResponse? ord1;
  // Model for drawer component.
  late DrawerModel drawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
