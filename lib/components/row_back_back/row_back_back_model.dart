import '/components/red_record/red_record_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'row_back_back_widget.dart' show RowBackBackWidget;
import 'package:flutter/material.dart';

class RowBackBackModel extends FlutterFlowModel<RowBackBackWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for RedRecord component.
  late RedRecordModel redRecordModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    redRecordModel = createModel(context, () => RedRecordModel());
  }

  @override
  void dispose() {
    redRecordModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
