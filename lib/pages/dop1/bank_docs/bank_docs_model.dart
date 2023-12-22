import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bank_docs_widget.dart' show BankDocsWidget;
import 'package:flutter/material.dart';

class BankDocsModel extends FlutterFlowModel<BankDocsWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  int? taskNumb;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // Stores action output result for [Backend Call - API (bankDocs)] action in Container-1 widget.
  ApiCallResponse? apiBankDoc;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
