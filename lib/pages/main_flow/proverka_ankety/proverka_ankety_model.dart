import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'proverka_ankety_widget.dart' show ProverkaAnketyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProverkaAnketyModel extends FlutterFlowModel<ProverkaAnketyWidget> {
  ///  Local state fields for this page.

  String? nextSl;

  int? nextSo;

  ///  State fields for stateful widgets in this page.

  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for Checkbox-1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox-2 widget.
  bool? checkbox2Value;
  // State field(s) for Checkbox-3 widget.
  bool? checkbox3Value;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  void dispose() {
    rowBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
