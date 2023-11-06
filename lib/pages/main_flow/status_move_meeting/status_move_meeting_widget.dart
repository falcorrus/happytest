import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_move_meeting_model.dart';
export 'status_move_meeting_model.dart';

class StatusMoveMeetingWidget extends StatefulWidget {
  const StatusMoveMeetingWidget({
    Key? key,
    this.slug,
  }) : super(key: key);

  final String? slug;

  @override
  _StatusMoveMeetingWidgetState createState() =>
      _StatusMoveMeetingWidgetState();
}

class _StatusMoveMeetingWidgetState extends State<StatusMoveMeetingWidget> {
  late StatusMoveMeetingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusMoveMeetingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'statusMoveMeeting'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 450.0,
              maxHeight: 900.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'STATUS_MOVE_MEETING_PAGE_Row-back_ON_TAP');
                                logFirebaseEvent('Row-back_navigate_to');

                                context.pushNamed(
                                  'status',
                                  queryParameters: {
                                    'slug': serializeParam(
                                      widget.slug,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 30.0,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 14.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Назад',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Перенос встречи',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primary,
                          weekFormat: false,
                          weekStartsMonday: true,
                          initialDate: getCurrentTimestamp,
                          rowHeight: 50.0,
                          onChange: (DateTimeRange? newSelectedDate) {
                            setState(() => _model.calendarDateSelectedDay =
                                newSelectedDate);
                          },
                          titleStyle: TextStyle(),
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          dateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF4460F0),
                                    fontSize: 20.0,
                                    letterSpacing: 0.38,
                                    fontWeight: FontWeight.normal,
                                  ),
                          selectedDateStyle: TextStyle(),
                          inactiveDateStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 20.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Время начала',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'STATUS_MOVE_MEETING_BUTTON_BTN_ON_TAP');
                                  logFirebaseEvent('Button_date_time_picker');
                                  if (kIsWeb) {
                                    final _datePicked1Time =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          getCurrentTimestamp),
                                    );
                                    if (_datePicked1Time != null) {
                                      safeSetState(() {
                                        _model.datePicked1 = DateTime(
                                          getCurrentTimestamp.year,
                                          getCurrentTimestamp.month,
                                          getCurrentTimestamp.day,
                                          _datePicked1Time.hour,
                                          _datePicked1Time.minute,
                                        );
                                      });
                                    }
                                  } else {
                                    await DatePicker.showTimePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        safeSetState(() {
                                          _model.datePicked1 = date;
                                        });
                                      },
                                      currentTime: getCurrentTimestamp,
                                      locale: LocaleType.values.firstWhere(
                                        (l) =>
                                            l.name ==
                                            FFLocalizations.of(context)
                                                .languageCode,
                                        orElse: () => LocaleType.en,
                                      ),
                                    );
                                  }

                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().startTime = _model.datePicked1;
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.startTime = _model.datePicked1;
                                },
                                text: valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    FFAppState().startTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  '0',
                                ),
                                options: FFButtonOptions(
                                  width: 138.0,
                                  height: 43.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 16.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Время окончания',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'STATUS_MOVE_MEETING_BUTTON_BTN_ON_TAP');
                                  logFirebaseEvent('Button_date_time_picker');
                                  if (kIsWeb) {
                                    final _datePicked2Time =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          getCurrentTimestamp),
                                    );
                                    if (_datePicked2Time != null) {
                                      safeSetState(() {
                                        _model.datePicked2 = DateTime(
                                          getCurrentTimestamp.year,
                                          getCurrentTimestamp.month,
                                          getCurrentTimestamp.day,
                                          _datePicked2Time.hour,
                                          _datePicked2Time.minute,
                                        );
                                      });
                                    }
                                  } else {
                                    await DatePicker.showTimePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        safeSetState(() {
                                          _model.datePicked2 = date;
                                        });
                                      },
                                      currentTime: getCurrentTimestamp,
                                      locale: LocaleType.values.firstWhere(
                                        (l) =>
                                            l.name ==
                                            FFLocalizations.of(context)
                                                .languageCode,
                                        orElse: () => LocaleType.en,
                                      ),
                                    );
                                  }

                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().EndTime = _model.datePicked2;
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.endTime = _model.datePicked2;
                                },
                                text: valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    FFAppState().EndTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  '0',
                                ),
                                options: FFButtonOptions(
                                  width: 138.0,
                                  height: 43.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 15.0, 24.0, 25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'STATUS_MOVE_MEETING_ПЕРЕНЕСТИ_ВСТРЕЧУ_BT');
                            logFirebaseEvent('Button_backend_call');
                            _model.apiTimeChange =
                                await HappyTestAPIGroup.meetingCall.call(
                              token: FFAppState().Token,
                              slug: FFAppState().slug,
                              date: functions
                                  .date(_model.calendarDateSelectedDay!.start),
                              start: functions.timeFunc(_model.startTime!),
                              finish: functions.timeFunc(_model.endTime!),
                            );
                            if ((_model.apiTimeChange?.succeeded ?? true)) {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Время поменялось',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFFB8CFF5),
                                ),
                              );
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('OrdersList');
                            } else {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Изменение НЕ удалось. Необходимо зайти в приложение повторно',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              logFirebaseEvent('Button_wait__delay');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'Login',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            }

                            setState(() {});
                          },
                          text: 'ПЕРЕНЕСТИ ВСТРЕЧУ',
                          options: FFButtonOptions(
                            width: 327.0,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF4460F0),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.5,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
