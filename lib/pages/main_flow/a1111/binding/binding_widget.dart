import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'binding_model.dart';
export 'binding_model.dart';

class BindingWidget extends StatefulWidget {
  const BindingWidget({
    super.key,
    this.nextslug,
    this.nextsort,
    this.slug,
  });

  final String? nextslug;
  final int? nextsort;
  final String? slug;

  @override
  _BindingWidgetState createState() => _BindingWidgetState();
}

class _BindingWidgetState extends State<BindingWidget> {
  late BindingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BindingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'binding'});
    _model.textFieldManualInputController ??= TextEditingController(
        text: FFAppState().scanAS != ''
            ? FFAppState().scanAS
            : ' ');
    _model.textFieldManualInputFocusNode ??= FocusNode();

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
                          'Введите ID карты для привязки карты',
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
                            30.0, 20.0, 30.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((FFAppState().IsScanBack == true) ||
                                  (_model.scan != ''))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.credit_card,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 24.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState().scanAS,
                                          'web',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              if ((FFAppState().IsScanBack == false) &&
                                  (_model.scan == ''))
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 2.0, 50.0, 2.0),
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldManualInputController,
                                      focusNode:
                                          _model.textFieldManualInputFocusNode,
                                      textInputAction: TextInputAction.done,
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
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            lineHeight: 1.5,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .textFieldManualInputControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (isWeb == false)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25.0, 10.0, 25.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BINDING_PAGE_Button-more_ON_TAP');
                              logFirebaseEvent(
                                  'Button-more_scan_barcode_q_r_code');
                              _model.scan =
                                  await FlutterBarcodeScanner.scanBarcode(
                                '#C62828', // scanning line color
                                'Отменить', // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.BARCODE,
                              );

                              logFirebaseEvent('Button-more_update_app_state');
                              setState(() {
                                FFAppState().scanAS = _model.scan;
                              });

                              setState(() {});
                            },
                            text: 'СКАНИРОВАТЬ',
                            icon: const Icon(
                              Icons.qr_code_scanner_outlined,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 327.0,
                              height: 48.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.5,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      if (isWeb == true)
                        Container(
                          width: 328.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const SizedBox(
                            width: 327.0,
                            height: 48.0,
                            child: custom_widgets.Qrscan(
                              width: 327.0,
                              height: 48.0,
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
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('BINDING_PAGE_Button-more_ON_TAP');
                            // в поле Card отсылается разное значение
                            // Если был скан, то ScanAS
                            // Если не было скана, то текстовое поле
                            logFirebaseEvent('Button-more_backend_call');
                            _model.apiBinding =
                                await HappyTestAPIGroup.nextmoduleCall.call(
                              token: FFAppState().Token,
                              productID: FFAppState().prodslug,
                              code: FFAppState().nextslug,
                              sort: FFAppState().nextsort,
                              orderId: FFAppState().slug,
                              crossProductId: FFAppState().prodslug,
                              card: FFAppState().scanAS != ''
                                  ? FFAppState().scanAS
                                  : _model.textFieldManualInputController.text,
                            );
                            if ((_model.apiBinding?.succeeded ?? true)) {
                              logFirebaseEvent('Button-more_update_app_state');
                              FFAppState().scanAS = '';
                              logFirebaseEvent('Button-more_action_block');
                              await action_blocks.mainAction(context);
                            } else {
                              logFirebaseEvent('Button-more_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'ID карты нет базе, попробуйте другой',
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
                            }

                            setState(() {});
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
        ),
      ),
    );
  }
}
