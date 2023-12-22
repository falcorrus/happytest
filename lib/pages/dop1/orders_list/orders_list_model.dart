import '/backend/api_requests/api_calls.dart';
import '/components/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (user)] action in Text widget.
  ApiCallResponse? apiAgent;
  // Stores action output result for [Backend Call - API (Orders)] action in IconButton widget.
  ApiCallResponse? apiResultOrders;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Stores action output result for [Backend Call - API (order)] action in IconButton widget.
  ApiCallResponse? ord1;
  // Model for drawer component.
  late DrawerModel drawerModel;

  /// Query cache managers for this widget.

  final _stakanManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> stakan({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _stakanManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStakanCache() => _stakanManager.clear();
  void clearStakanCacheKey(String? uniqueKey) =>
      _stakanManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();

    /// Dispose query cache managers for this widget.

    clearStakanCache();
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
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
