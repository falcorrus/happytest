import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'photo_verification_error_model.dart';
export 'photo_verification_error_model.dart';

class PhotoVerificationErrorWidget extends StatefulWidget {
  const PhotoVerificationErrorWidget({
    super.key,
    required this.comment,
  });

  final String? comment;

  @override
  _PhotoVerificationErrorWidgetState createState() =>
      _PhotoVerificationErrorWidgetState();
}

class _PhotoVerificationErrorWidgetState
    extends State<PhotoVerificationErrorWidget> {
  late PhotoVerificationErrorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoVerificationErrorModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            width: 352.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Icon(
                            Icons.error,
                            color: FlutterFlowTheme.of(context).error,
                            size: 40.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Text(
                            'Верификация не пройдена',
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            widget.comment!,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  letterSpacing: 0.18,
                                  lineHeight: 1.1,
                                ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 14.0, 15.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PHOTO_VERIFICATION_ERROR_ИСПРАВИТЬ_BTN_O');
                                logFirebaseEvent('Button_update_app_state');
                                setState(() {
                                  FFAppState().nextslug = 'photos';
                                  FFAppState().nextsort =
                                      FFAppState().nextsort + -1;
                                });
                                logFirebaseEvent('Button_bottom_sheet');
                                Navigator.pop(context);
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'Photos',
                                  queryParameters: {
                                    'slug': serializeParam(
                                      FFAppState().slug,
                                      ParamType.String,
                                    ),
                                    'nextslug': serializeParam(
                                      FFAppState().nextslug,
                                      ParamType.String,
                                    ),
                                    'nextsort': serializeParam(
                                      FFAppState().nextsort,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Исправить',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent3,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
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
                              showLoadingIndicator: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PHOTO_VERIFICATION_ERROR_ЗАВЕРШИТЬ_ВСТРЕ');
                                logFirebaseEvent('Button_bottom_sheet');
                                logFirebaseEvent('Button_backend_call');
                                _model.apiResult6ag =
                                    await HappyTestAPIGroup.statusCall.call(
                                  token: FFAppState().Token,
                                  slug: FFAppState().slug,
                                  status: 'denied',
                                );
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('OrdersList');

                                setState(() {});
                              },
                              text: 'Завершить встречу',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF4460F0),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
