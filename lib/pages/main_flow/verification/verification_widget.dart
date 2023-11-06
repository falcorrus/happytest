import '/backend/api_requests/api_calls.dart';
import '/components/create_photo_string/create_photo_string_widget.dart';
import '/components/photo_verification_error/photo_verification_error_widget.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_model.dart';
export 'verification_model.dart';

class VerificationWidget extends StatefulWidget {
  const VerificationWidget({
    Key? key,
    required this.slug,
    this.nextslug,
    this.nextsort,
  }) : super(key: key);

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _VerificationWidgetState createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  late VerificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Verification'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.rowBackModel,
                  updateCallback: () => setState(() {}),
                  child: RowBackWidget(),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, -0.10),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: HappyTestAPIGroup.orderCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final containerOrderResponse = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'VERIFICATION_Container_q24dbxmg_ON_TAP');
                                logFirebaseEvent('Container_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CreatePhotoStringWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: 350.0,
                                height: 181.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        'Отправлено!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 18.0,
                                              letterSpacing: 0.18,
                                              lineHeight: 1.1,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: Text(
                                        'Фотографии отправлены на верификацию в бэк-офис',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.0,
                                              letterSpacing: 0.18,
                                              lineHeight: 1.1,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 34.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'VERIFICATION_ПОЛУЧИТЬ_РЕЗУЛЬТАТ_ПРОВЕРКИ');
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.apiResultOfVerif =
                                                      await HappyTestAPIGroup
                                                          .orderCall
                                                          .call(
                                                    token: FFAppState().Token,
                                                    slug: FFAppState().slug,
                                                  );
                                                  if ((_model.apiResultOfVerif
                                                          ?.succeeded ??
                                                      true)) {
                                                    if (HappyTestAPIGroup
                                                            .orderCall
                                                            .statusslug(
                                                              (_model.apiResultOfVerif
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            .toString() ==
                                                        'verified') {
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      _model.apiResult =
                                                          await HappyTestAPIGroup
                                                              .nextmoduleCall
                                                              .call(
                                                        token:
                                                            FFAppState().Token,
                                                        productID: FFAppState()
                                                            .prodslug,
                                                        code: widget.nextslug,
                                                        sort: widget.nextsort,
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Документы подтверждены',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1000),
                                                          backgroundColor:
                                                              Color(0xFFB8CFF5),
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.nextSl =
                                                          HappyTestAPIGroup
                                                              .nextmoduleCall
                                                              .code(
                                                                (_model.apiResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                              .toString();
                                                      _model.nextSo =
                                                          _model.nextSo;
                                                      if (_model.nextSl ==
                                                          'show_agreement') {
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                          'ShowAgreement',
                                                          queryParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              FFAppState().slug,
                                                              ParamType.String,
                                                            ),
                                                            'nextslug':
                                                                serializeParam(
                                                              _model.nextSl,
                                                              ParamType.String,
                                                            ),
                                                            'nextsort':
                                                                serializeParam(
                                                              _model.nextSo,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        if (_model.nextSl ==
                                                            'photos') {
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                            'Photos',
                                                            queryParameters: {
                                                              'slug':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .slug,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'nextslug':
                                                                  serializeParam(
                                                                _model.nextSl,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'nextsort':
                                                                  serializeParam(
                                                                _model.nextSo,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (_model.nextSl ==
                                                              'wire_card') {
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                              'BindingOtkrytie',
                                                              queryParameters: {
                                                                'nextslug':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .nextslug,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'nextsort':
                                                                    serializeParam(
                                                                  _model.nextSo,
                                                                  ParamType.int,
                                                                ),
                                                                'slug':
                                                                    serializeParam(
                                                                  _model.nextSo
                                                                      ?.toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (_model.nextSl ==
                                                                'verification') {
                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.pushNamed(
                                                                'Verification',
                                                                queryParameters:
                                                                    {
                                                                  'slug':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                        .slug,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'nextslug':
                                                                      serializeParam(
                                                                    _model
                                                                        .nextSl,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'nextsort':
                                                                      serializeParam(
                                                                    _model
                                                                        .nextSo,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              if (_model
                                                                      .nextSl ==
                                                                  'send_sms') {
                                                                logFirebaseEvent(
                                                                    'Button_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'SigningSms',
                                                                  queryParameters:
                                                                      {
                                                                    'slug':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                          .slug,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'nextslug':
                                                                        serializeParam(
                                                                      _model
                                                                          .nextSl,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'nextsort':
                                                                        serializeParam(
                                                                      _model
                                                                          .nextSo,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                if (_model
                                                                        .nextSl ==
                                                                    'check_report') {
                                                                  logFirebaseEvent(
                                                                      'Button_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'proverka-ankety',
                                                                    queryParameters:
                                                                        {
                                                                      'slug':
                                                                          serializeParam(
                                                                        FFAppState()
                                                                            .slug,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'nextslug':
                                                                          serializeParam(
                                                                        _model
                                                                            .nextSl,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'nextsort':
                                                                          serializeParam(
                                                                        _model
                                                                            .nextSo,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  if (_model
                                                                          .nextSl ==
                                                                      'cross_product') {
                                                                    logFirebaseEvent(
                                                                        'Button_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'DopMain',
                                                                      queryParameters:
                                                                          {
                                                                        'slug':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .slug,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'nextslug':
                                                                            serializeParam(
                                                                          _model
                                                                              .nextSl,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'nextsort':
                                                                            serializeParam(
                                                                          _model
                                                                              .nextSo,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    } else if (HappyTestAPIGroup
                                                            .orderCall
                                                            .statusslug(
                                                              (_model.apiResultOfVerif
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            .toString() ==
                                                        'denied') {
                                                      logFirebaseEvent(
                                                          'Button_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PhotoVerificationErrorWidget(
                                                                comment: HappyTestAPIGroup
                                                                    .orderCall
                                                                    .comment(
                                                                      (_model.apiResultOfVerif
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                    .toString(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      _model.apiSetStatusDenied =
                                                          await HappyTestAPIGroup
                                                              .statusCall
                                                              .call(
                                                        token:
                                                            FFAppState().Token,
                                                        slug: FFAppState().slug,
                                                        status:
                                                            'meeting_confirmed',
                                                      );
                                                      if ((_model
                                                              .apiSetStatusDenied
                                                              ?.succeeded ??
                                                          true)) {
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                          'Order',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Документы на проверке',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          backgroundColor:
                                                              Color(0xFFB8CFF5),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'запрос Order не прошел',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    'Получить результат проверки',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF4460F0),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
