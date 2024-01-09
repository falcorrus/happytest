import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'proverka_ankety_model.dart';
export 'proverka_ankety_model.dart';

class ProverkaAnketyWidget extends StatefulWidget {
  const ProverkaAnketyWidget({
    super.key,
    this.slug,
    this.nextslug,
    this.nextsort,
  });

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _ProverkaAnketyWidgetState createState() => _ProverkaAnketyWidgetState();
}

class _ProverkaAnketyWidgetState extends State<ProverkaAnketyWidget>
    with TickerProviderStateMixin {
  late ProverkaAnketyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProverkaAnketyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'proverka-ankety'});

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FFAppConstants.background,
      body: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Container(
          height: double.infinity,
          constraints: BoxConstraints(
            maxWidth: FFAppConstants.maxWidth.toDouble(),
            maxHeight: FFAppConstants.maxHeight.toDouble(),
          ),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              wrapWithModel(
                model: _model.rowBackModel,
                updateCallback: () => setState(() {}),
                child: const RowBackWidget(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25.0, 13.0, 0.0, 0.0),
                          child: Text(
                            'Анкета',
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 20.0, 26.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Видны признаки маргинального поведения (состояние опьянения, агрессивного поведения и пр.)',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkbox1Value ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkbox1Value = newValue!);
                                      if (newValue!) {
                                        logFirebaseEvent(
                                            'PROVERKA_ANKETY_Checkbox-1_ON_TOGGLE_ON');
                                        logFirebaseEvent(
                                            'Checkbox-1_action_block');
                                        await _model.anketa(context);
                                      } else {
                                        logFirebaseEvent(
                                            'PROVERKA_ANKETY_Checkbox-1_ON_TOGGLE_OFF');
                                        logFirebaseEvent(
                                            'Checkbox-1_action_block');
                                        await _model.anketa(context);
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 20.0, 26.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Признаки мошенничества (паспорт имеет признаки подделки, признаки неплатежеспособности, неуверенное поведение и пр.)',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkbox2Value ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkbox2Value = newValue!);
                                      if (newValue!) {
                                        logFirebaseEvent(
                                            'PROVERKA_ANKETY_Checkbox-2_ON_TOGGLE_ON');
                                        logFirebaseEvent(
                                            'Checkbox-2_action_block');
                                        await _model.anketa(context);
                                      } else {
                                        logFirebaseEvent(
                                            'PROVERKA_ANKETY_Checkbox-2_ON_TOGGLE_OFF');
                                        logFirebaseEvent(
                                            'Checkbox-2_action_block');
                                        await _model.anketa(context);
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 20.0, 26.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Принуждение клиентом (третьими лицами) курьера к оформлению заявки',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkbox3Value ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkbox3Value = newValue!);
                                      if (newValue!) {
                                        logFirebaseEvent(
                                            'PROVERKA_ANKETY_Checkbox-3_ON_TOGGLE_ON');
                                        logFirebaseEvent(
                                            'Checkbox-3_action_block');
                                        await _model.anketa(context);
                                      } else {
                                        logFirebaseEvent(
                                            'PROVERKA_ANKETY_Checkbox-3_ON_TOGGLE_OFF');
                                        logFirebaseEvent(
                                            'Checkbox-3_action_block');
                                        await _model.anketa(context);
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 25.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'PROVERKA_ANKETY_PAGE_Button-more_ON_TAP');
                        logFirebaseEvent('Button-more_action_block');
                        await action_blocks.mainAction(context);
                      },
                      text: 'ДАЛЕЕ',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
