import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'binding_widget.dart' show BindingWidget;
import 'package:flutter/material.dart';

class BindingModel extends FlutterFlowModel<BindingWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for TextField-ManualInput widget.
  FocusNode? textFieldManualInputFocusNode;
  TextEditingController? textFieldManualInputController;
  String? Function(BuildContext, String?)?
      textFieldManualInputControllerValidator;
  var scan = '';
  // Stores action output result for [Backend Call - API (nextmodule)] action in Button-more widget.
  ApiCallResponse? apiBinding;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
    textFieldManualInputFocusNode?.dispose();
    textFieldManualInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
