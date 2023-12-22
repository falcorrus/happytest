import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'show_agreement_widget.dart' show ShowAgreementWidget;
import 'package:flutter/material.dart';

class ShowAgreementModel extends FlutterFlowModel<ShowAgreementWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (nextmodule)] action in ShowAgreement widget.
  ApiCallResponse? apiResultProduct02;
  // Model for row_back component.
  late RowBackModel rowBackModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
