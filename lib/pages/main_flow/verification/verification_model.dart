import '/backend/api_requests/api_calls.dart';
import '/components/create_photo_string/create_photo_string_widget.dart';
import '/components/photo_verification_error/photo_verification_error_widget.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'verification_widget.dart' show VerificationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationModel extends FlutterFlowModel<VerificationWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // Stores action output result for [Backend Call - API (order)] action in Button widget.
  ApiCallResponse? apiResultOfVerif;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Button widget.
  ApiCallResponse? apiResult;
  // Stores action output result for [Backend Call - API (status)] action in Button widget.
  ApiCallResponse? apiSetStatusDenied;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
