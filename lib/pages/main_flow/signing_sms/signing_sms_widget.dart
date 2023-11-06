import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'signing_sms_model.dart';
export 'signing_sms_model.dart';

class SigningSmsWidget extends StatefulWidget {
  const SigningSmsWidget({
    Key? key,
    this.slug,
    this.nextslug,
    this.nextsort,
  }) : super(key: key);

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _SigningSmsWidgetState createState() => _SigningSmsWidgetState();
}

class _SigningSmsWidgetState extends State<SigningSmsWidget> {
  late SigningSmsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SigningSmsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SigningSms'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SIGNING_SMS_SigningSms_ON_INIT_STATE');
      // cr - Expression, добавляет пробелы к тексту
      logFirebaseEvent('SigningSms_update_page_state');
      _model.tel = functions.extractDigits(FFAppState().clientTel);
      _model.cr = (String var1) {
        return "\n" + "\n" + var1 + "\n" + "\n";
      }('${FFAppState().clientTel}');
      logFirebaseEvent('SigningSms_backend_call');
      _model.apiSend2EnterCode = await HappyTestAPIGroup.nextmoduleCall.call(
        token: FFAppState().Token,
        productID: FFAppState().prodslug,
        code: widget.nextslug,
        sort: widget.nextsort,
        phone: _model.tel,
      );
      logFirebaseEvent('SigningSms_update_page_state');
      _model.nextSl = HappyTestAPIGroup.nextmoduleCall
          .code(
            (_model.apiSend2EnterCode?.jsonBody ?? ''),
          )
          .toString();
      _model.nextSo = HappyTestAPIGroup.nextmoduleCall.sort(
        (_model.apiSend2EnterCode?.jsonBody ?? ''),
      );
      if ((_model.apiSend2EnterCode?.succeeded ?? true)) {
        if (_model.nextSl ==
            HappyTestAPIGroup.nextmoduleCall
                .code(
                  (_model.apiSend2EnterCode?.jsonBody ?? ''),
                )
                .toString()) {
          logFirebaseEvent('SigningSms_update_page_state');
          _model.nextSl = HappyTestAPIGroup.nextmoduleCall
              .code(
                (_model.apiSend2EnterCode?.jsonBody ?? ''),
              )
              .toString();
          _model.nextSo = HappyTestAPIGroup.nextmoduleCall.sort(
            (_model.apiSend2EnterCode?.jsonBody ?? ''),
          );
        } else {
          logFirebaseEvent('SigningSms_update_page_state');
          _model.nextSl = widget.nextslug;
          _model.nextSo = widget.nextsort;
        }
      } else {
        logFirebaseEvent('SigningSms_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'смс НЕ ушла. Вставьте в сценарий проверку СМС сразу после отправки СМС',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    });

    _model.textFieldSmsController ??= TextEditingController();
    _model.textFieldSmsFocusNode ??= FocusNode();

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

    return FutureBuilder<ApiCallResponse>(
      future: HappyTestAPIGroup.orderCall.call(
        slug: FFAppState().slug,
        token: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final signingSmsOrderResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                  maxHeight: 1100.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wrapWithModel(
                      model: _model.rowBackModel,
                      updateCallback: () => setState(() {}),
                      child: RowBackWidget(),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 13.0, 0.0, 0.0),
                              child: Text(
                                'Подписание клиент',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 24.0, 25.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SIGNING_SMS_PAGE_Container-1_ON_TAP');
                                logFirebaseEvent(
                                    'Container-1_upload_media_to_firebase');
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                logFirebaseEvent('Container-1_wait__delay');
                                await Future.delayed(
                                    const Duration(milliseconds: 1000));
                              },
                              child: Container(
                                height: 160.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F1FE),
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0xFFEFEFF4),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.05),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: Text(
                                      'Сообщение с кодом подтверждения отправлено на номер: ${_model.tel}        Введите полученный код в поле ниже',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 20.0, 26.0, 0.0),
                            child: Container(
                              height: 47.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextFormField(
                                controller: _model.textFieldSmsController,
                                focusNode: _model.textFieldSmsFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Введите код из СМС',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .textFieldSmsControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.textFieldSmsMask],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 15.0, 25.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SIGNING_SMS_PAGE_Button-again_ON_TAP');
                                    logFirebaseEvent(
                                        'Button-again_backend_call');
                                    _model.apiResultCopy =
                                        await HappyTestAPIGroup.nextmoduleCall
                                            .call(
                                      token: FFAppState().Token,
                                      productID: FFAppState().prodslug,
                                      code: widget.nextslug,
                                      sort: widget.nextsort,
                                      phone: _model.tel,
                                    );
                                    logFirebaseEvent(
                                        'Button-again_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'смс отправлено',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0xFFB8CFF5),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                  text: 'ПОВТОРНО ПОЛУЧИТЬ СМС',
                                  options: FFButtonOptions(
                                    width: 327.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFEAEAEA),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF5F5F5F),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 10.0, 25.0, 25.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onDoubleTap: () async {
                                    logFirebaseEvent(
                                        'SIGNING_SMS_Button-more_ON_DOUBLE_TAP');
                                    logFirebaseEvent(
                                        'Button-more_action_block');
                                    await action_blocks.mainAction(context);
                                  },
                                  onLongPress: () async {
                                    logFirebaseEvent(
                                        'SIGNING_SMS_Button-more_ON_LONG_PRESS');
                                    if (widget.nextslug == 'send_sms') {
                                      logFirebaseEvent(
                                          'Button-more_backend_call');
                                      _model.apiResultCopy2 =
                                          await HappyTestAPIGroup.nextmoduleCall
                                              .call(
                                        token: FFAppState().Token,
                                        productID: FFAppState().prodslug,
                                        code: _model.nextSl,
                                        sort: _model.nextSo,
                                        phone: _model.tel,
                                        smsCode:
                                            _model.textFieldSmsController.text,
                                      );
                                      if ((_model.apiResultCopy2?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'Button-more_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'след страница получена',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 500),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Button-more_update_page_state');
                                        _model.nextSl =
                                            HappyTestAPIGroup.nextmoduleCall
                                                .code(
                                                  (_model.apiResultCopy2
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString();
                                        _model.nextSo = HappyTestAPIGroup
                                            .nextmoduleCall
                                            .sort(
                                          (_model.apiResultCopy2?.jsonBody ??
                                              ''),
                                        );
                                        logFirebaseEvent(
                                            'Button-more_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              _model.nextSl!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Button-more_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 2000));
                                        if ((_model.apiResultCopy2?.succeeded ??
                                            true)) {
                                          if (_model.nextSl ==
                                              'show_agreement') {
                                            logFirebaseEvent(
                                                'Button-more_navigate_to');

                                            context.pushNamed(
                                              'ShowAgreement',
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
                                          } else {
                                            if (_model.nextSl == 'photos') {
                                              logFirebaseEvent(
                                                  'Button-more_navigate_to');

                                              context.pushNamed(
                                                'Photos',
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
                                            } else {
                                              if (_model.nextSl ==
                                                  'wire_card') {
                                                logFirebaseEvent(
                                                    'Button-more_navigate_to');

                                                context.pushNamed(
                                                  'BindingOtkrytie',
                                                  queryParameters: {
                                                    'nextslug': serializeParam(
                                                      _model.nextSl,
                                                      ParamType.String,
                                                    ),
                                                    'nextsort': serializeParam(
                                                      _model.nextSo,
                                                      ParamType.int,
                                                    ),
                                                    'slug': serializeParam(
                                                      FFAppState().slug,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                logFirebaseEvent(
                                                    'Button-more_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      HappyTestAPIGroup
                                                          .orderCall
                                                          .phone(
                                                            signingSmsOrderResponse
                                                                .jsonBody,
                                                          )
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                              } else {
                                                if (_model.nextSl ==
                                                    'verification') {
                                                  logFirebaseEvent(
                                                      'Button-more_navigate_to');

                                                  context.pushNamed(
                                                    'proverka-ankety',
                                                    queryParameters: {
                                                      'slug': serializeParam(
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
                                                      'send_sms') {
                                                    logFirebaseEvent(
                                                        'Button-more_navigate_to');

                                                    context.pushNamed(
                                                      'SigningSms',
                                                      queryParameters: {
                                                        'slug': serializeParam(
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
                                                        'check_report') {
                                                      logFirebaseEvent(
                                                          'Button-more_navigate_to');

                                                      context.pushNamed(
                                                        'proverka-ankety',
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
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button-more_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'tel или код не подошли',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'Button-more_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'api SMS не ушла',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent(
                                          'Button-more_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'nextSl не равен \"send_sms\"',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    logFirebaseEvent('Button-more_navigate_to');

                                    context.goNamed('SigningSms');

                                    setState(() {});
                                  },
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SIGNING_SMS_PAGE_Button-more_ON_TAP');
                                      logFirebaseEvent(
                                          'Button-more_action_block');
                                      await action_blocks.mainAction(context);
                                    },
                                    text: 'ДАЛЕЕ',
                                    options: FFButtonOptions(
                                      width: 327.0,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
