import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dop_main_model.dart';
export 'dop_main_model.dart';

class DopMainWidget extends StatefulWidget {
  const DopMainWidget({
    super.key,
    required this.slug,
    this.nextslug,
    required this.nextsort,
  });

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _DopMainWidgetState createState() => _DopMainWidgetState();
}

class _DopMainWidgetState extends State<DopMainWidget> {
  late DopMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DopMainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'DopMain'});
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
            constraints: const BoxConstraints(
              maxWidth: 600.0,
              maxHeight: 1100.0,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Дополнительные продукты',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color: const Color(0xFF525252),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
                      child: Container(
                        width: 328.0,
                        height: 139.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7F00FF), Color(0xFFBD00FF)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 0.0),
                            end: AlignmentDirectional(-1.0, 0),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: const Color(0xFFEFEFF4),
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'DOP_MAIN_PAGE_Column_ko1juhni_ON_TAP');
                            // Алексей:**
                            // ну да, когда передаешь code cross_product, надо передавать поля orderId и crossProductId - это айди выбранного кросс продукта
                            //
                            // если клиент решил ничего не выбирать, то просто crossProductId не передаешь и сценарий пойдет дальше
                            // 1496,Оптимальный Лукойл
                            // 1493,Карта Спартак
                            logFirebaseEvent('Column_backend_call');
                            _model.apiNextModule =
                                await HappyTestAPIGroup.nextmoduleCall.call(
                              token: FFAppState().Token,
                              productID: FFAppState().prodslug,
                              code: widget.nextslug,
                              sort: widget.nextsort,
                              crossProductId: 1496,
                              orderId: FFAppState().slug,
                            );
                            if ((_model.apiNextModule?.succeeded ?? true)) {
                              logFirebaseEvent('Column_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Новая заявка будет первой',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              logFirebaseEvent('Column_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed(
                                'OrdersList',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            } else {
                              logFirebaseEvent('Column_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Новая заявка НЕ создана',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 2000),
                                  backgroundColor: const Color(0xFFB8CFF5),
                                ),
                              );
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed(
                                'DopMain',
                                queryParameters: {
                                  'slug': serializeParam(
                                    FFAppState().slug,
                                    ParamType.String,
                                  ),
                                  'nextslug': serializeParam(
                                    _model.nextSl,
                                    ParamType.String,
                                  ),
                                  'nextsort': serializeParam(
                                    _model.nextSo,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 64.0, 0.0, 0.0),
                                  child: Text(
                                    'Оптимальный Лукойл',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: const Color(0xC2FFFFC2),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 0.0, 17.0),
                                  child: Text(
                                    'Кэшбек',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: const Color(0xFFFFFFC2),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 328.0,
                        height: 139.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF7E5F), Color(0xFFFEB47B)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 0.0),
                            end: AlignmentDirectional(-1.0, 0),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: const Color(0xFFEFEFF4),
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'DOP_MAIN_PAGE_Column_p746aazg_ON_TAP');
                            // Алексей:**
                            // ну да, когда передаешь code cross_product, надо передавать поля orderId и crossProductId - это айди выбранного кросс продукта
                            //
                            // если клиент решил ничего не выбирать, то просто crossProductId не передаешь и сценарий пойдет дальше
                            // 1496,Оптимальный Лукойл
                            // 1493,Карта Спартак
                            logFirebaseEvent('Column_backend_call');
                            _model.apiNextModuleCopy =
                                await HappyTestAPIGroup.nextmoduleCall.call(
                              token: FFAppState().Token,
                              productID: FFAppState().prodslug,
                              code: widget.nextslug,
                              sort: widget.nextsort,
                              crossProductId: 1493,
                              orderId: FFAppState().slug,
                            );
                            if ((_model.apiNextModule?.succeeded ?? true)) {
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed(
                                'OrdersList',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            } else {
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed(
                                'DopMain',
                                queryParameters: {
                                  'slug': serializeParam(
                                    FFAppState().slug,
                                    ParamType.String,
                                  ),
                                  'nextslug': serializeParam(
                                    _model.nextSl,
                                    ParamType.String,
                                  ),
                                  'nextsort': serializeParam(
                                    _model.nextSo,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            logFirebaseEvent('Column_store_media_for_upload');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 64.0, 0.0, 0.0),
                                  child: Text(
                                    'Карта Спартак',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: const Color(0xC2FFFFFF),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 0.0, 17.0),
                                  child: Text(
                                    'Мили',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            logFirebaseEvent(
                                'DOP_MAIN_PAGE_Button-more_ON_TAP');
                            logFirebaseEvent('Button-more_backend_call');
                            _model.order =
                                await HappyTestAPIGroup.orderCall.call(
                              token: FFAppState().Token,
                              slug: FFAppState().slug,
                            );
                            if (HappyTestAPIGroup.orderCall.bank(
                                  (_model.order?.jsonBody ?? ''),
                                ) ==
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
