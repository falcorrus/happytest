import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'binding_akbars_widget.dart' show BindingAkbarsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BindingAkbarsModel extends FlutterFlowModel<BindingAkbarsWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for TextField-mail widget.
  FocusNode? textFieldMailFocusNode;
  TextEditingController? textFieldMailController;
  String? Function(BuildContext, String?)? textFieldMailControllerValidator;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Button-more widget.
  ApiCallResponse? apiNextModule;
  // Stores action output result for [Backend Call - API (status)] action in Button-more widget.
  ApiCallResponse? apiResult6ag;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
    textFieldMailFocusNode?.dispose();
    textFieldMailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
