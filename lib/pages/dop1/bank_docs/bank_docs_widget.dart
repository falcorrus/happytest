import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/photo_delete/photo_delete_widget.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'bank_docs_model.dart';
export 'bank_docs_model.dart';

class BankDocsWidget extends StatefulWidget {
  const BankDocsWidget({
    super.key,
    required this.agentSlug,
    required this.customerId,
  });

  final String? agentSlug;
  final String? customerId;

  @override
  _BankDocsWidgetState createState() => _BankDocsWidgetState();
}

class _BankDocsWidgetState extends State<BankDocsWidget>
    with TickerProviderStateMixin {
  late BankDocsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => BankDocsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bankDocs'});

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
      future: HappyTestAPIGroup.bankDocsCall.call(
        customerID: widget.customerId,
        agentSlug: widget.agentSlug,
        token: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FFAppConstants.background,
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
        final bankDocsBankDocsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FFAppConstants.background,
            body: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BANK_DOCS_PAGE_Container_lvn90xfa_ON_TAP');
                              logFirebaseEvent('row_back_action_block');
                              await action_blocks.actionBack(context);
                            },
                            child: wrapWithModel(
                              model: _model.rowBackModel,
                              updateCallback: () => setState(() {}),
                              child: const RowBackWidget(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Банковские документы',
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final allDocs = HappyTestAPIGroup.bankDocsCall
                                        .data(
                                          bankDocsBankDocsResponse.jsonBody,
                                        )
                                        ?.toList() ??
                                    [];
                                if (allDocs.isEmpty) {
                                  return const EmptyListWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: allDocs.length,
                                  itemBuilder: (context, allDocsIndex) {
                                    final allDocsItem = allDocs[allDocsIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 14.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'BANK_DOCS_PAGE_Container-1_ON_TAP');
                                          logFirebaseEvent(
                                              'Container-1_backend_call');
                                          _model.apiBankDoc =
                                              await HappyTestAPIGroup
                                                  .bankDocsCall
                                                  .call();
                                          if ((_model.apiBankDoc?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Container-1_launch_u_r_l');
                                            await launchURL(getJsonField(
                                              allDocsItem,
                                              r'''$.data.files.path''',
                                            ).toString());
                                          } else {
                                            logFirebaseEvent(
                                                'Container-1_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                          }

                                          setState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.easeInOut,
                                          width: 348.0,
                                          height: 68.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color(0xFFEFEFF4),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AnimatedContainer(
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.easeIn,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      13.0),
                                                        ),
                                                        child: Text(
                                                          allDocsItem
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'BANK_DOCS_PAGE_close_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            const Color(0x00000000),
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: SizedBox(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.6,
                                                                child:
                                                                    PhotoDeleteWidget(
                                                                  slug:
                                                                      FFAppState()
                                                                          .slug,
                                                                  taskNo:
                                                                      getJsonField(
                                                                    allDocsItem,
                                                                    r'''$.task_no''',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'listViewOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 25.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'BANK_DOCS_PAGE_Button-acceptTemp_ON_TAP');
                        logFirebaseEvent('Button-acceptTemp_navigate_back');
                        context.safePop();
                      },
                      text: 'ВЕРНУТЬСЯ',
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
            ),
          ),
        );
      },
    );
  }
}
