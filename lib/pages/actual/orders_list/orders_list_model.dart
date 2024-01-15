import '/backend/api_requests/api_calls.dart';
import '/components/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'orders_list_widget.dart' show OrdersListWidget;
import 'package:flutter/material.dart';

class OrdersListModel extends FlutterFlowModel<OrdersListWidget> {
  ///  Local state fields for this page.

  String? nextSlp;

  int? nextSop;

  String? pdf = '';

  bool? isWork = false;

  String today = '';

  List<String> stringAdress = [];
  void addToStringAdress(String item) => stringAdress.add(item);
  void removeFromStringAdress(String item) => stringAdress.remove(item);
  void removeAtIndexFromStringAdress(int index) => stringAdress.removeAt(index);
  void insertAtIndexInStringAdress(int index, String item) =>
      stringAdress.insert(index, item);
  void updateStringAdressAtIndex(int index, Function(String) updateFn) =>
      stringAdress[index] = updateFn(stringAdress[index]);

  List<dynamic> listJson = [];
  void addToListJson(dynamic item) => listJson.add(item);
  void removeFromListJson(dynamic item) => listJson.remove(item);
  void removeAtIndexFromListJson(int index) => listJson.removeAt(index);
  void insertAtIndexInListJson(int index, dynamic item) =>
      listJson.insert(index, item);
  void updateListJsonAtIndex(int index, Function(dynamic) updateFn) =>
      listJson[index] = updateFn(listJson[index]);

  bool push = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (YandexNew)] action in IconButton-right widget.
  ApiCallResponse? returnGeo;
  // Stores action output result for [Backend Call - API (user)] action in Text widget.
  ApiCallResponse? apiAgent;
  // Stores action output result for [Backend Call - API (Orders)] action in IconButton widget.
  ApiCallResponse? apiResultOrders;
  Completer<ApiCallResponse>? apiRequestCompleter;
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

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
