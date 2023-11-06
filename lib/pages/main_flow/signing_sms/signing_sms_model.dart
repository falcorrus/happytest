import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'signing_sms_widget.dart' show SigningSmsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SigningSmsModel extends FlutterFlowModel<SigningSmsWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  String? tel;

  String cr = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (nextmodule)] action in SigningSms widget.
  ApiCallResponse? apiSend2EnterCode;
  // Model for row_back component.
  late RowBackModel rowBackModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField-sms widget.
  FocusNode? textFieldSmsFocusNode;
  TextEditingController? textFieldSmsController;
  final textFieldSmsMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? textFieldSmsControllerValidator;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Button-again widget.
  ApiCallResponse? apiResultCopy;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Button-more widget.
  ApiCallResponse? apiResultCopy2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    rowBackModel.dispose();
    textFieldSmsFocusNode?.dispose();
    textFieldSmsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
