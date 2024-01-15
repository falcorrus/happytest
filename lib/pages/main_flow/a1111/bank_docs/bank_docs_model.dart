import '/components/message_widget.dart';
import '/components/row_back_back/row_back_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bank_docs_widget.dart' show BankDocsWidget;
import 'package:flutter/material.dart';

class BankDocsModel extends FlutterFlowModel<BankDocsWidget> {
  ///  Local state fields for this page.

  String orderSlugLS = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for row_BackBack component.
  late RowBackBackModel rowBackBackModel;
  // Model for Message component.
  late MessageModel messageModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackBackModel = createModel(context, () => RowBackBackModel());
    messageModel = createModel(context, () => MessageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackBackModel.dispose();
    messageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
