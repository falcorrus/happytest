import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scan_cards_widget.dart' show ScanCardsWidget;
import 'package:flutter/material.dart';

class ScanCardsModel extends FlutterFlowModel<ScanCardsWidget> {
  ///  Local state fields for this page.

  String? bankChoosen = '';

  String? bank = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  var scanAPKResult = '';
  // State field(s) for ManualN widget.
  FocusNode? manualNFocusNode;
  TextEditingController? manualNController;
  String? Function(BuildContext, String?)? manualNControllerValidator;
  // Stores action output result for [Backend Call - API (bindProduct)] action in IconButton_enter widget.
  ApiCallResponse? bindProdScanned;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
    manualNFocusNode?.dispose();
    manualNController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
