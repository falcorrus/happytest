import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signing_client_widget.dart' show SigningClientWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SigningClientModel extends FlutterFlowModel<SigningClientWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for Signature widget.
  SignatureController? signatureController;
  String uploadedSignatureUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
    signatureController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
