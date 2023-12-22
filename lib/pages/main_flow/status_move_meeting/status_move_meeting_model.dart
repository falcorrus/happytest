import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'status_move_meeting_widget.dart' show StatusMoveMeetingWidget;
import 'package:flutter/material.dart';

class StatusMoveMeetingModel extends FlutterFlowModel<StatusMoveMeetingWidget> {
  ///  Local state fields for this page.

  DateTime? startTime;

  DateTime? endTime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar-date widget.
  DateTimeRange? calendarDateSelectedDay;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - API (meeting)] action in Button widget.
  ApiCallResponse? apiTimeChange;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarDateSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
