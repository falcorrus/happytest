import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/row_back_back/row_back_back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'scan_cards_model.dart';
export 'scan_cards_model.dart';

class ScanCardsWidget extends StatefulWidget {
  const ScanCardsWidget({
    super.key,
    this.nextslug,
    this.nextsort,
    this.slug,
    required this.bankName,
  });

  final String? nextslug;
  final int? nextsort;
  final String? slug;
  final String? bankName;

  @override
  _ScanCardsWidgetState createState() => _ScanCardsWidgetState();
}

class _ScanCardsWidgetState extends State<ScanCardsWidget>
    with TickerProviderStateMixin {
  late ScanCardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-97.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanCardsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ScanCards'});
    _model.manualNController ??=
        TextEditingController(text: FFAppState().scanAS);
    _model.manualNFocusNode ??= FocusNode();

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
          alignment: const AlignmentDirectional(0.0, -1.0),
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
              color: FFAppConstants.background,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.rowBackBackModel,
                  updateCallback: () => setState(() {}),
                  child: const RowBackBackWidget(),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 13.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onDoubleTap: () async {
                        logFirebaseEvent(
                            'SCAN_CARDS_Text-cancelMeeting_ON_DOUBLE_');
                        logFirebaseEvent(
                            'Text-cancelMeeting_update_page_state');
                        setState(() {
                          _model.bank = FFAppConstants.bankNameConst;
                        });
                      },
                      onLongPress: () async {
                        logFirebaseEvent(
                            'SCAN_CARDS_Text-cancelMeeting_ON_LONG_PR');
                        logFirebaseEvent(
                            'Text-cancelMeeting_update_page_state');
                        setState(() {
                          _model.bank = 'bank-rosbank';
                        });
                      },
                      child: Text(
                        'Привязка карт',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                ),
                if (_model.bank != 'bank-rosbank')
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.spaceBetween,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SCAN_CARDS_PAGE_ContainAlfa_ON_TAP');
                                      logFirebaseEvent(
                                          'ContainAlfa_update_page_state');
                                      setState(() {
                                        _model.bankChoosen = 'alfa';
                                      });
                                    },
                                    child: Container(
                                      width: 140.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: _model.bankChoosen == 'alfa'
                                            ? FlutterFlowTheme.of(context)
                                                .accent3
                                            : const Color(0x00000000),
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'assets/images/Alfa_Bank1.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SCAN_CARDS_PAGE_ContainAkbars_ON_TAP');
                                      logFirebaseEvent(
                                          'ContainAkbars_update_page_state');
                                      setState(() {
                                        _model.bankChoosen = 'akbars';
                                      });
                                    },
                                    child: Container(
                                      width: 140.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: _model.bankChoosen == 'akbars'
                                            ? FlutterFlowTheme.of(context)
                                                .accent3
                                            : const Color(0x00000000),
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'assets/images/akbars.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SCAN_CARDS_PAGE_ContainOtkrytie_ON_TAP');
                                      logFirebaseEvent(
                                          'ContainOtkrytie_update_page_state');
                                      setState(() {
                                        _model.bankChoosen = 'otkrytie';
                                      });
                                    },
                                    child: Container(
                                      width: 140.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: _model.bankChoosen == 'otkrytie'
                                            ? FlutterFlowTheme.of(context)
                                                .accent3
                                            : const Color(0x00000000),
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'assets/images/otkritie_logo.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SCAN_CARDS_PAGE_ContainRosbank_ON_TAP');
                                      logFirebaseEvent(
                                          'ContainRosbank_update_page_state');
                                      setState(() {
                                        _model.bankChoosen = 'bank-rosbank';
                                      });
                                    },
                                    child: Container(
                                      width: 140.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color:
                                            _model.bankChoosen == 'bank-rosbank'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : const Color(0x00000000),
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'assets/images/Rosbank1.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isWeb == false)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 18.0, 25.0, 6.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'SCAN_CARDS_Button-ScanAndroid_ON_TAP');
                        logFirebaseEvent(
                            'Button-ScanAndroid_scan_barcode_q_r_code');
                        _model.scanAPKResult =
                            await FlutterBarcodeScanner.scanBarcode(
                          '#C62828', // scanning line color
                          'Cancel', // cancel button text
                          true, // whether to show the flash icon
                          ScanMode.QR,
                        );

                        logFirebaseEvent('Button-ScanAndroid_update_app_state');
                        setState(() {
                          FFAppState().scanAS = _model.scanAPKResult;
                          FFAppState().IsScanBack = true;
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
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent4,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.5,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                if (isWeb == true)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: Container(
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
                  ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (FFAppState().IsScanBack == true)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.credit_card,
                                  color: FlutterFlowTheme.of(context).accent1,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
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
                        if (FFAppState().IsScanBack == false)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 2.0, 10.0, 2.0),
                              child: TextFormField(
                                controller: _model.manualNController,
                                focusNode: _model.manualNFocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'ID карты',
                                  hintText: FFAppState().scanAS,
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
                                    Icons.credit_card_sharp,
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
                                validator: _model.manualNControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 10.0, 10.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.add_task,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SCAN_CARDS_PAGE_IconButton_enter_ON_TAP');
                                  if ((_model.bankChoosen != null &&
                                          _model.bankChoosen != '') ||
                                      (FFAppConstants.bankNameConst ==
                                          'bank-rosbank')) {
                                    // проверка, что в WEB было сканирование. Если False, то берётся значение из ручного ввода
                                    if (FFAppState().IsScanBack != true) {
                                      logFirebaseEvent(
                                          'IconButton_enter_update_app_state');
                                      FFAppState().scanAS =
                                          _model.manualNController.text;
                                      logFirebaseEvent(
                                          'IconButton_enter_wait__delay');
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                    }
                                    logFirebaseEvent(
                                        'IconButton_enter_backend_call');
                                    _model.bindProdScanned =
                                        await HappyTestAPIGroup.bindProductCall
                                            .call(
                                      token: FFAppState().Token,
                                      bankName: FFAppConstants.bankNameConst ==
                                              'bank-rosbank'
                                          ? 'bank-rosbank'
                                          : _model.bankChoosen,
                                      cardId: FFAppState().scanAS,
                                    );
                                    if ((_model.bindProdScanned?.succeeded ??
                                            true) ==
                                        true) {
                                      logFirebaseEvent(
                                          'IconButton_enter_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'API работает',
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
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_enter_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'API не ушло',
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

                                    logFirebaseEvent(
                                        'IconButton_enter_update_app_state');
                                    setState(() {
                                      FFAppState()
                                          .addToScanCards(ScansCardsStruct(
                                        bankName:
                                            FFAppConstants.bankNameConst ==
                                                    'bank-rosbank'
                                                ? 'bank-rosbank'
                                                : _model.bankChoosen,
                                        cardID: FFAppState().scanAS,
                                      ));
                                      FFAppState().scanAS = '';
                                      FFAppState().IsScanBack = false;
                                    });
                                    logFirebaseEvent(
                                        'IconButton_enter_set_form_field');
                                    setState(() {
                                      _model.manualNController?.text = '';
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_enter_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Выберите банк'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final scanCardsList = FFAppState().scanCards.toList();
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        reverse: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: scanCardsList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, scanCardsListIndex) {
                          final scanCardsListItem =
                              scanCardsList[scanCardsListIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: const Color(0xFFEFEFF4),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          scanCardsListItem.cardID,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          scanCardsListItem.bankName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'SCAN_CARDS_PAGE_close_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_update_app_state');
                                            setState(() {
                                              FFAppState().removeFromScanCards(
                                                  scanCardsListItem);
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).animateOnPageLoad(
                          animationsMap['listViewOnPageLoadAnimation']!);
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 25.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('SCAN_CARDS_PAGE_Button-more_ON_TAP');
                        logFirebaseEvent('Button-more_navigate_to');

                        context.goNamed(
                          'OrdersList',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                            ),
                          },
                        );
                      },
                      text: 'ЗАКОНЧИТЬ ПРИВЯЗКУ',
                      options: FFButtonOptions(
                        width: 327.0,
                        height: 48.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
