import '/backend/api_requests/api_calls.dart';
import '/components/create_photo_string/create_photo_string_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_verification_error_model.dart';
export 'photo_verification_error_model.dart';

class PhotoVerificationErrorWidget extends StatefulWidget {
  const PhotoVerificationErrorWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

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
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('PHOTO_VERIFICATION_ERROR_Container_dj62q');
              logFirebaseEvent('Container_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0x00000000),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CreatePhotoStringWidget(),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Container(
              width: 352.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x0F000000),
                    offset: Offset(0.0, 4.0),
                  )
                ],
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Icon(
                          Icons.error,
                          color: FlutterFlowTheme.of(context).error,
                          size: 40.0,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Text(
                          'Верификация не пройдена',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    letterSpacing: 0.18,
                                    lineHeight: 1.1,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.comment,
                            'com param',
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PHOTO_VERIFICATION_ERROR_ИСПРАВИТЬ_BTN_O');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('Order');
                                  },
                                  text: 'Исправить',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 20.0),
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
                                      status: 'zaversit-vstrecu',
                                    );
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('OrdersList');

                                    setState(() {});
                                  },
                                  text: 'Завершить встречу',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF4460F0),
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
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
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
          ),
        ),
      ],
    );
  }
}
