import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'finish_model.dart';
export 'finish_model.dart';

class FinishWidget extends StatefulWidget {
  const FinishWidget({
    super.key,
    required this.slug,
    this.nextslug,
    required this.nextsort,
  });

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _FinishWidgetState createState() => _FinishWidgetState();
}

class _FinishWidgetState extends State<FinishWidget> {
  late FinishModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinishModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Finish'});
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
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: FFAppConstants.maxWidth.toDouble(),
              maxHeight: FFAppConstants.maxHeight.toDouble(),
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(1.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 65.0, 0.0, 0.0),
                    child: Text(
                      'Готово!',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Montserrat',
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 10.0, 25.0, 25.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('FINISH_PAGE_Button-more_ON_TAP');
                            logFirebaseEvent('Button-more_backend_call');
                            _model.order =
                                await HappyTestAPIGroup.orderCall.call(
                              token: FFAppState().Token,
                              slug: FFAppState().slug,
                            );
                            if (HappyTestAPIGroup.orderCall
                                    .bank(
                                      (_model.order?.jsonBody ?? ''),
                                    )
                                    .toString() ==
                                'bank-rosbank') {
                              logFirebaseEvent('Button-more_backend_call');
                              await HappyTestAPIGroup.statusCall.call(
                                slug: FFAppState().slug,
                                token: FFAppState().Token,
                                status: 'zaversit-vstrecu',
                              );
                              logFirebaseEvent('Button-more_backend_call');
                              await HappyTestAPIGroup.statusCall.call(
                                slug: FFAppState().slug,
                                token: FFAppState().Token,
                                status: 'waiting_verification',
                              );
                              logFirebaseEvent('Button-more_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Статус "Завершить встречу"',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 2000),
                                  backgroundColor: const Color(0xFFB8CFF5),
                                ),
                              );
                            } else {
                              logFirebaseEvent('Button-more_backend_call');
                              await HappyTestAPIGroup.statusCall.call(
                                slug: FFAppState().slug,
                                token: FFAppState().Token,
                                status: 'zaversit-vstrecu',
                              );
                              logFirebaseEvent('Button-more_backend_call');
                              await HappyTestAPIGroup.statusCall.call(
                                slug: FFAppState().slug,
                                token: FFAppState().Token,
                                status: 'karta-vydana',
                              );
                              logFirebaseEvent('Button-more_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Статус "Завершить встречу" и "карта выдана"',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 2000),
                                  backgroundColor: const Color(0xFFB8CFF5),
                                ),
                              );
                            }

                            logFirebaseEvent('Button-more_wait__delay');
                            logFirebaseEvent('Button-more_navigate_to');

                            context.goNamed('OrdersList');

                            setState(() {});
                          },
                          text: 'ЗАВЕРШИТЬ ВСТРЕЧУ',
                          options: FFButtonOptions(
                            width: 327.0,
                            height: 48.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          showLoadingIndicator: false,
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
