import '/backend/api_requests/api_calls.dart';
import '/components/bank_cancel/bank_cancel_widget.dart';
import '/components/client_cancel/client_cancel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'status_widget.dart' show StatusWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusModel extends FlutterFlowModel<StatusWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (status)] action in Row-transMeeting widget.
  ApiCallResponse? apiResulteqs;
  // Stores action output result for [Backend Call - API (nextmodule)] action in Row-noContact widget.
  ApiCallResponse? apiResultkl5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
