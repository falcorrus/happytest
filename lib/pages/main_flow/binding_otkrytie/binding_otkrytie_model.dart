import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'binding_otkrytie_widget.dart' show BindingOtkrytieWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BindingOtkrytieModel extends FlutterFlowModel<BindingOtkrytieWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for TextField-mail widget.
  FocusNode? textFieldMailFocusNode1;
  TextEditingController? textFieldMailController1;
  final textFieldMailMask1 = MaskTextInputFormatter(mask: '#### ####');
  String? Function(BuildContext, String?)? textFieldMailController1Validator;
  // State field(s) for TextField-mail widget.
  FocusNode? textFieldMailFocusNode2;
  TextEditingController? textFieldMailController2;
  final textFieldMailMask2 = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? textFieldMailController2Validator;
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
    textFieldMailFocusNode1?.dispose();
    textFieldMailController1?.dispose();

    textFieldMailFocusNode2?.dispose();
    textFieldMailController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
