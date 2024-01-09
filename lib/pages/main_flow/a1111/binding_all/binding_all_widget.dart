import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'binding_all_model.dart';
export 'binding_all_model.dart';

class BindingAllWidget extends StatefulWidget {
  const BindingAllWidget({
    super.key,
    this.nextslug,
    this.nextsort,
    this.slug,
  });

  final String? nextslug;
  final int? nextsort;
  final String? slug;

  @override
  _BindingAllWidgetState createState() => _BindingAllWidgetState();
}

class _BindingAllWidgetState extends State<BindingAllWidget> {
  late BindingAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BindingAllModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BindingAll'});
    _model.textFieldMailController1 ??= TextEditingController();
    _model.textFieldMailFocusNode1 ??= FocusNode();

    _model.textFieldMailController2 ??= TextEditingController();
    _model.textFieldMailFocusNode2 ??= FocusNode();

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
          child: Container(
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
                wrapWithModel(
                  model: _model.rowBackModel,
                  updateCallback: () => setState(() {}),
                  child: const RowBackWidget(),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 13.0, 0.0, 0.0),
                    child: Text(
                      'Привязка карты',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Montserrat',
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(25.0, 24.0, 25.0, 20.0),
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1FE),
                      borderRadius: BorderRadius.circular(11.0),
                      border: Border.all(
                        color: const Color(0xFFEFEFF4),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.05),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            22.0, 0.0, 22.0, 10.0),
                        child: Text(
                          'Введите ID карты и последние 4 цифры номера карты для привязки карты.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 20.0, 30.0, 10.0),
                        child: Container(
                          width: 315.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 2.0, 50.0, 2.0),
                            child: TextFormField(
                              controller: _model.textFieldMailController1,
                              focusNode: _model.textFieldMailFocusNode1,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'ID карты',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.numbers,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xFFBDBDBD),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.5,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .textFieldMailController1Validator
                                  .asValidator(context),
                              inputFormatters: [_model.textFieldMailMask1],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 20.0, 30.0, 10.0),
                        child: Container(
                          width: 315.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 2.0, 50.0, 2.0),
                            child: TextFormField(
                              controller: _model.textFieldMailController2,
                              focusNode: _model.textFieldMailFocusNode2,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Последние 4 цифры карты',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.numbers,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xFFBDBDBD),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.5,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .textFieldMailController2Validator
                                  .asValidator(context),
                              inputFormatters: [_model.textFieldMailMask2],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 10.0, 25.0, 25.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onDoubleTap: () async {
                            logFirebaseEvent(
                                'BINDING_ALL_Button-more_ON_DOUBLE_TAP');
                            logFirebaseEvent('Button-more_backend_call');
                            _model.apiNextModule =
                                await HappyTestAPIGroup.nextmoduleCall.call(
                              token: FFAppState().Token,
                              productID: FFAppState().prodslug,
                              code: widget.nextslug,
                              sort: widget.nextsort,
                            );
                            logFirebaseEvent('Button-more_update_page_state');
                            _model.nextSl = widget.nextslug;
                            _model.nextSo = widget.nextsort;
                            if ((_model.apiNextModule?.succeeded ?? true)) {
                              if (_model.nextSl == 'show_agreement') {
                                logFirebaseEvent('Button-more_navigate_to');

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
                                  logFirebaseEvent('Button-more_navigate_to');

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
                                  if (_model.nextSl == 'wire_card') {
                                    logFirebaseEvent('Button-more_navigate_to');

                                    context.pushNamed(
                                      'BindingAll',
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
                                  } else {
                                    if (_model.nextSl == 'verification') {
                                      logFirebaseEvent(
                                          'Button-more_backend_call');
                                      _model.apiResult6ag =
                                          await HappyTestAPIGroup.statusCall
                                              .call(
                                        token: FFAppState().Token,
                                        slug: FFAppState().slug,
                                        status: 'waiting_verification',
                                      );
                                      if ((_model.apiResult6ag?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'Button-more_navigate_to');

                                        context.pushNamed(
                                          'Verification',
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
                                    } else {
                                      if (_model.nextSl == 'send_sms') {
                                        logFirebaseEvent(
                                            'Button-more_navigate_to');

                                        context.pushNamed(
                                          'SigningSms',
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
                                        if (_model.nextSl == 'check_report') {
                                          logFirebaseEvent(
                                              'Button-more_navigate_to');

                                          context.pushNamed(
                                            'proverka-ankety',
                                            queryParameters: {
                                              'slug': serializeParam(
                                                FFAppState().slug,
                                                ParamType.String,
                                              ),
                                              'nextslug': serializeParam(
                                                widget.nextslug,
                                                ParamType.String,
                                              ),
                                              'nextsort': serializeParam(
                                                widget.nextsort,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          if (_model.nextSl == 'verification') {
                                            logFirebaseEvent(
                                                'Button-more_navigate_to');

                                            context.pushNamed(
                                              'Verification',
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
                                                'verification') {
                                              logFirebaseEvent(
                                                  'Button-more_navigate_to');

                                              context.pushNamed(
                                                'Verification',
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
                                                  'cross_product') {
                                                logFirebaseEvent(
                                                    'Button-more_navigate_to');

                                                context.pushNamed(
                                                  'Finish',
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
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            } else {
                              logFirebaseEvent('Button-more_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Модули в сценарии закончились',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 2000),
                                  backgroundColor: const Color(0xFFB8CFF5),
                                ),
                              );
                              logFirebaseEvent('Button-more_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 2000));
                              logFirebaseEvent('Button-more_navigate_to');

                              context.pushNamed(
                                'Finish',
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
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BINDING_ALL_PAGE_Button-more_ON_TAP');
                              logFirebaseEvent('Button-more_action_block');
                              await action_blocks.mainAction(context);
                            },
                            text: 'ДАЛЕЕ',
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
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
