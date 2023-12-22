import '/backend/api_requests/api_calls.dart';
import '/components/create_photo_string/create_photo_string_widget.dart';
import '/components/photo_verification_error_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'verification_comp_model.dart';
export 'verification_comp_model.dart';

class VerificationCompWidget extends StatefulWidget {
  const VerificationCompWidget({super.key});

  @override
  _VerificationCompWidgetState createState() => _VerificationCompWidgetState();
}

class _VerificationCompWidgetState extends State<VerificationCompWidget> {
  late VerificationCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                logFirebaseEvent('VERIFICATION_Container_igs9x771_ON_TAP');
                logFirebaseEvent('Container_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: const Color(0x00000000),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: const CreatePhotoStringWidget(),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
                width: 350.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Text(
                        'Отправлено!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              letterSpacing: 0.18,
                              lineHeight: 1.1,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        'Фотографии отправлены на верификацию\n в бэк-офис',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              letterSpacing: 0.18,
                              lineHeight: 1.1,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 34.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onDoubleTap: () async {
                                  logFirebaseEvent(
                                      'VERIFICATION_ПОЛУЧИТЬ_РЕЗУЛЬТАТ_ПРОВЕРКИ');
                                  logFirebaseEvent('Button_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: PhotoVerificationErrorWidget(
                                          comment: HappyTestAPIGroup.orderCall
                                              .comment(
                                                (_model.apiResultOfVerif
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiSetStatusDeniedCopy =
                                      await HappyTestAPIGroup.statusCall.call(
                                    token: FFAppState().Token,
                                    slug: FFAppState().slug,
                                    status: 'denied',
                                  );
                                  if ((_model.apiSetStatusDenied?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'Order',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  }

                                  setState(() {});
                                },
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VERIFICATION_ПОЛУЧИТЬ_РЕЗУЛЬТАТ_ПРОВЕРКИ');
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResultOfVerif =
                                        await HappyTestAPIGroup.orderCall.call(
                                      token: FFAppState().Token,
                                      slug: FFAppState().slug,
                                    );
                                    if ((_model.apiResultOfVerif?.succeeded ??
                                        true)) {
                                      if (HappyTestAPIGroup.orderCall
                                              .statusslug(
                                                (_model.apiResultOfVerif
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString() ==
                                          'verified') {
                                        logFirebaseEvent('Button_action_block');
                                        await action_blocks.mainAction(context);
                                      } else if (HappyTestAPIGroup.orderCall
                                              .statusslug(
                                                (_model.apiResultOfVerif
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString() ==
                                          'denied') {
                                        logFirebaseEvent('Button_backend_call');
                                        _model.apiSetStatusDenied =
                                            await HappyTestAPIGroup.statusCall
                                                .call(
                                          token: FFAppState().Token,
                                          slug: FFAppState().slug,
                                          status: 'denied',
                                        );
                                        if ((_model.apiSetStatusDenied
                                                ?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Button_navigate_to');
                                        }
                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                        // photoVerifError
                                        logFirebaseEvent(
                                            'Button_photoVerifError');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  PhotoVerificationErrorWidget(
                                                comment:
                                                    HappyTestAPIGroup.orderCall
                                                        .comment(
                                                          (_model.apiResultOfVerif
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Документы на проверке',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 500),
                                            backgroundColor: const Color(0xFFB8CFF5),
                                          ),
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'запрос Order не прошел',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Получить результат проверки',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
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
    );
  }
}
