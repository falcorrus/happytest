import '/components/row_back/row_back_widget.dart';
import '/components/verification_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verification_widget.dart' show VerificationWidget;
import 'package:flutter/material.dart';

class VerificationModel extends FlutterFlowModel<VerificationWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // Model for verificationComp component.
  late VerificationCompModel verificationCompModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
    verificationCompModel = createModel(context, () => VerificationCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
    verificationCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
