import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'proverka_ankety_widget.dart' show ProverkaAnketyWidget;
import 'package:flutter/material.dart';

class ProverkaAnketyModel extends FlutterFlowModel<ProverkaAnketyWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for Checkbox-1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox-2 widget.
  bool? checkbox2Value;
  // State field(s) for Checkbox-3 widget.
  bool? checkbox3Value;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  @override
  void dispose() {
    rowBackModel.dispose();
  }

  /// Action blocks are added here.

  Future anketa(BuildContext context) async {
    ApiCallResponse? apiSetQandA;

    logFirebaseEvent('anketa_backend_call');
    apiSetQandA = await HappyTestAPIGroup.nextmoduleCall.call(
      token: FFAppState().Token,
      code: FFAppState().nextslug,
      sort: FFAppState().nextsort,
      productID: FFAppState().prodslug,
      orderId: FFAppState().slug,
      a1: checkbox1Value,
      a2: checkbox2Value,
      a3: checkbox3Value,
    );
  }

  /// Additional helper methods are added here.
}
