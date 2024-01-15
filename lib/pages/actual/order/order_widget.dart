import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'order_model.dart';
export 'order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    super.key,
    this.slug,
    this.nextslug,
    this.nextsort,
  });

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget>
    with TickerProviderStateMixin {
  late OrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Order'});

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
      future: FFAppState().order(
        requestFn: () => HappyTestAPIGroup.orderCall.call(
          token: FFAppState().Token,
          slug: FFAppState().slug,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
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
        final orderOrderResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: FutureBuilder<ApiCallResponse>(
              future: YandexNewCall.call(
                geokode: valueOrDefault<String>(
                  '${HappyTestAPIGroup.orderCall.city(
                    orderOrderResponse.jsonBody,
                  )}+${HappyTestAPIGroup.orderCall.adress(
                    orderOrderResponse.jsonBody,
                  )}',
                  'Москва красная площадь',
                ),
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
                final stackYandexNewResponse = snapshot.data!;
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ORDER_PAGE_Stack_mqy96k21_ON_TAP');
                    logFirebaseEvent('Stack_update_page_state');
                    _model.isPersonalPS =
                        HappyTestAPIGroup.orderCall.isPersonal(
                      (_model.apiOrder?.jsonBody ?? ''),
                    );
                  },
                  child: Stack(
                    children: [
                      if (stackYandexNewResponse.statusCode == 200)
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: FlutterFlowStaticMap(
                            location: functions.latLong(YandexNewCall.latLong(
                              stackYandexNewResponse.jsonBody,
                            )!
                                .toList()),
                            apiKey:
                                'pk.eyJ1IjoibGFwdHlzIiwiYSI6ImNsNnhndml5bzBjdXMzanJ4cnpxajA4N2cifQ.lmFnbGdUcyz_CQo1SA1YPA',
                            style: MapBoxStyle.Outdoors,
                            width: double.infinity,
                            height: 400.0,
                            fit: BoxFit.cover,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            markerColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            cached: true,
                            zoom: 12,
                            tilt: 0,
                            rotation: 0,
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxHeight: 812.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 27.0,
                                color: Color(0x4A000000),
                                offset: Offset(0.0, 4.0),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(26.0),
                              topRight: Radius.circular(26.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ORDER_PAGE_Row-back_ON_TAP');
                                      logFirebaseEvent('Row-back_navigate_to');

                                      context.pushNamed('OrdersList');
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 30.0,
                                              icon: Icon(
                                                Icons.chevron_left,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 14.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Назад',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 6.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ORDER_PAGE_Text_7bb2cc2z_ON_TAP');
                                        logFirebaseEvent('Text_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                orderOrderResponse.jsonBody,
                                                r'''$.data.agent.name''',
                                              ).toString(),
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
                                      },
                                      child: Text(
                                        'Статус заказа',
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
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 14.0, 0.0),
                                            child: Icon(
                                              Icons.circle,
                                              color: colorFromCssString(
                                                valueOrDefault<String>(
                                                  HappyTestAPIGroup.orderCall
                                                      .color(
                                                    orderOrderResponse.jsonBody,
                                                  ),
                                                  'black',
                                                ),
                                                defaultColor: Colors.black,
                                              ),
                                              size: 12.0,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_Text_1vghg2yt_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_copy_to_clipboard');
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: valueOrDefault<
                                                          String>(
                                                getJsonField(
                                                  orderOrderResponse.jsonBody,
                                                  r'''$.data.externalAgreement''',
                                                )?.toString(),
                                                'externalAgreement',
                                              )));
                                              logFirebaseEvent(
                                                  'Text_launch_u_r_l');
                                              await launchURL(
                                                  valueOrDefault<String>(
                                                getJsonField(
                                                  orderOrderResponse.jsonBody,
                                                  r'''$.data.externalAgreement''',
                                                )?.toString(),
                                                'externalAgreement',
                                              ));
                                            },
                                            child: Text(
                                              valueOrDefault<String>(
                                                HappyTestAPIGroup.orderCall
                                                    .status(
                                                  orderOrderResponse.jsonBody,
                                                ),
                                                'error',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.1,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.21,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ORDER_PAGE_Text_0di0d8qc_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_backend_call');
                                            await HappyTestAPIGroup.statusCall
                                                .call(
                                              slug: widget.slug,
                                              status: 'waiting',
                                              token: FFAppState().Token,
                                            );
                                            logFirebaseEvent(
                                                'Text_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Назначаем waiting "Ожидает доставку"',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    const Color(0xFFB8CFF5),
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Text_update_app_state');
                                            setState(() {
                                              FFAppState().nextsort = 0;
                                              FFAppState().nextslug = '';
                                            });
                                            logFirebaseEvent(
                                                'Text_navigate_to');
                                          },
                                          child: Text(
                                            valueOrDefault<String>(
                                              HappyTestAPIGroup.orderCall.id(
                                                orderOrderResponse.jsonBody,
                                              ),
                                              'id',
                                            ),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: const Color(0xFFC6C6C6),
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 15.0, 0.0, 10.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        '${HappyTestAPIGroup.orderCall.start(
                                          orderOrderResponse.jsonBody,
                                        )} - ${HappyTestAPIGroup.orderCall.finish(
                                          orderOrderResponse.jsonBody,
                                        )}',
                                        'error',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: const Color(0xFF4460F0),
                                            fontSize: 28.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.22,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'Клиент',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: const Color(0xFF868686),
                                            fontSize: 10.0,
                                            letterSpacing: 0.1,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 0.0, 1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        '${valueOrDefault<String>(
                                          HappyTestAPIGroup.orderCall.lastName(
                                            orderOrderResponse.jsonBody,
                                          ),
                                          'Фамилия',
                                        )} ${valueOrDefault<String>(
                                          HappyTestAPIGroup.orderCall.firstName(
                                            orderOrderResponse.jsonBody,
                                          ),
                                          'Имя',
                                        )} ${valueOrDefault<String>(
                                          HappyTestAPIGroup.orderCall
                                              .middleName(
                                            orderOrderResponse.jsonBody,
                                          ),
                                          'отчество',
                                        )}',
                                        'error',
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500,
                                            lineHeight: 1.21,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Text(
                                                  'Адрес',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            const Color(0xFF868686),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.1,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ORDER_PAGE_Text-address_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Text-address_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        HappyTestAPIGroup
                                                            .orderCall
                                                            .adress(
                                                          orderOrderResponse
                                                              .jsonBody,
                                                        )!,
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  HappyTestAPIGroup.orderCall
                                                      .adress(
                                                    orderOrderResponse.jsonBody,
                                                  )!,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.1,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        lineHeight: 1.21,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: YandexNewCall.call(
                                            geokode: valueOrDefault<String>(
                                              '${HappyTestAPIGroup.orderCall.city(
                                                orderOrderResponse.jsonBody,
                                              )}+${HappyTestAPIGroup.orderCall.adress(
                                                orderOrderResponse.jsonBody,
                                              )}',
                                              'Москва красная площадь',
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final iconButtonYandexNewResponse =
                                                snapshot.data!;
                                            return FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 18.0,
                                              borderWidth: 1.0,
                                              buttonSize: 48.0,
                                              icon: const Icon(
                                                Icons.map_outlined,
                                                color: Color(0xFF4460F0),
                                                size: 18.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'ORDER_PAGE_map_outlined_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_launch_u_r_l');
                                                await launchURL(
                                                    valueOrDefault<String>(
                                                  'https://yandex.ru/maps/?pt=${functions.textLat(functions.latLong(YandexNewCall.latLong(
                                                    iconButtonYandexNewResponse
                                                        .jsonBody,
                                                  )!.toList()))}',
                                                  '0',
                                                ));
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  'Номер телефона',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            const Color(0xFF868686),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.1,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  HappyTestAPIGroup.orderCall
                                                      .phone(
                                                    orderOrderResponse.jsonBody,
                                                  ),
                                                  'error',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.1,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          lineHeight: 1.21,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 18.0,
                                          borderWidth: 1.0,
                                          buttonSize: 32.0,
                                          icon: const Icon(
                                            Icons.phone,
                                            color: Color(0xFF4460F0),
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ORDER_PAGE_phone_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_launch_u_r_l');
                                            await launchURL('tel:${getJsonField(
                                              orderOrderResponse.jsonBody,
                                              r'''$.phone''',
                                            ).toString()}');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      'Название продукта',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: const Color(0xFF868686),
                                            fontSize: 10.0,
                                            letterSpacing: 0.1,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        HappyTestAPIGroup.orderCall.product(
                                          orderOrderResponse.jsonBody,
                                        ),
                                        'продукт',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500,
                                            lineHeight: 1.21,
                                          ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Персональная: ',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 12.0,
                                                letterSpacing: 0.1,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.21,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          () {
                                            if (_model.isPersonalPS == true) {
                                              return 'да';
                                            } else if ((_model.isPersonalPS ==
                                                    false) ==
                                                false) {
                                              return 'нет';
                                            } else {
                                              return 'не определено';
                                            }
                                          }(),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 12.0,
                                                letterSpacing: 0.1,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.21,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 20.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ORDER_PAGE_Text-title_date_ON_TAP');
                                        logFirebaseEvent(
                                            'Text-title_date_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              FFAppState().nextslug,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 1000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Дата встречи',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: const Color(0xFF868686),
                                              fontSize: 10.0,
                                              letterSpacing: 0.1,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        HappyTestAPIGroup.orderCall.date(
                                          orderOrderResponse.jsonBody,
                                        ),
                                        'error',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500,
                                            lineHeight: 1.21,
                                          ),
                                    ),
                                  ),
                                ),

                                // Из status waiting "Ожидает доставку" показываем "Подтвердить встречу" (статус "meeting_confirmed"
                                if ((HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'waiting') ||
                                    (HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'move_to_delivery'))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 15.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_ПОДТВЕРДИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiStatus =
                                                  await HappyTestAPIGroup
                                                      .statusCall
                                                      .call(
                                                slug: widget.slug,
                                                status: 'meeting_confirmed',
                                                token: FFAppState().Token,
                                                comment: ' ',
                                              );
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiOrder =
                                                  await HappyTestAPIGroup
                                                      .orderCall
                                                      .call(
                                                token: FFAppState().Token,
                                                slug: FFAppState().slug,
                                              );
                                              if (HappyTestAPIGroup.orderCall
                                                      .statusslug(
                                                    (_model.apiOrder
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'meeting_confirmed') {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Встреча подтверждена',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        const Color(0xFFB8CFF5),
                                                  ),
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Встреча НЕ подтверждена',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        const Color(0xFFB8CFF5),
                                                  ),
                                                );
                                              }

                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiResultProduct2 =
                                                  await HappyTestAPIGroup
                                                      .nextmoduleCall
                                                      .call(
                                                token: FFAppState().Token,
                                                productID:
                                                    FFAppState().prodslug,
                                                code: widget.nextslug,
                                                sort: widget.nextsort,
                                                orderId: FFAppState().slug,
                                              );
                                              if ((_model.apiResultProduct2
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Button_update_app_state');
                                                setState(() {
                                                  FFAppState().nextslug =
                                                      valueOrDefault<String>(
                                                    HappyTestAPIGroup
                                                        .nextmoduleCall
                                                        .code(
                                                      (_model.apiResultProduct2
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    '111',
                                                  );
                                                  FFAppState().nextsort =
                                                      HappyTestAPIGroup
                                                          .nextmoduleCall
                                                          .sort(
                                                    (_model.apiResultProduct2
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!;
                                                });
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                setState(() {
                                                  _model.nextSl =
                                                      HappyTestAPIGroup
                                                          .nextmoduleCall
                                                          .code(
                                                    (_model.apiResultProduct2
                                                            ?.jsonBody ??
                                                        ''),
                                                  );
                                                  _model.nextSo =
                                                      HappyTestAPIGroup
                                                          .nextmoduleCall
                                                          .sort(
                                                    (_model.apiResultProduct2
                                                            ?.jsonBody ??
                                                        ''),
                                                  );
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Next api не прошел',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        const Color(0xFFB8CFF5),
                                                  ),
                                                );
                                              }

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              setState(() {});
                                            },
                                            text: 'ПОДТВЕРДИТЬ ВСТРЕЧУ',
                                            options: FFButtonOptions(
                                              width: 327.0,
                                              height: 48.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
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
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 15.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_ОТМЕНИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().status =
                                                  HappyTestAPIGroup.orderCall
                                                      .statusslug(
                                                orderOrderResponse.jsonBody,
                                              )!;
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'status',
                                                queryParameters: {
                                                  'slug': serializeParam(
                                                    widget.slug,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'ОТМЕНИТЬ ВСТРЕЧУ',
                                            options: FFButtonOptions(
                                              width: 327.0,
                                              height: 48.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: const Color(0xFF5F5F5F),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                // status meeting_confirmed "Встреча подтверждена"
                                if ((HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'meeting_confirmed') ||
                                    (HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'nacat-vstrecu'))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 15.0, 24.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onDoubleTap: () async {
                                              logFirebaseEvent(
                                                  'ORDER_НАЧАТЬ_ВСТРЕЧУ_BTN_ON_DOUBLE_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await HappyTestAPIGroup.statusCall
                                                  .call(
                                                slug: widget.slug,
                                                status: 'nacat-vstrecu',
                                                token: FFAppState().Token,
                                              );
                                              if (FFAppState().nextslug ==
                                                  'show_agreement') {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'ShowAgreement',
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
                                              } else {
                                                if (FFAppState().nextslug ==
                                                    'photos') {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                    'Photos',
                                                    queryParameters: {
                                                      'slug': serializeParam(
                                                        widget.slug,
                                                        ParamType.String,
                                                      ),
                                                      'nextslug':
                                                          serializeParam(
                                                        FFAppState().nextslug,
                                                        ParamType.String,
                                                      ),
                                                      'nextsort':
                                                          serializeParam(
                                                        FFAppState().nextsort,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (FFAppState().nextslug ==
                                                      'wire_card') {
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                      'BindingAll',
                                                      queryParameters: {
                                                        'nextslug':
                                                            serializeParam(
                                                          FFAppState().nextslug,
                                                          ParamType.String,
                                                        ),
                                                        'nextsort':
                                                            serializeParam(
                                                          FFAppState().nextsort,
                                                          ParamType.int,
                                                        ),
                                                        'slug': serializeParam(
                                                          FFAppState().slug,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    if (FFAppState().nextslug ==
                                                        'wire_card') {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        'BindingAll',
                                                        queryParameters: {
                                                          'nextslug':
                                                              serializeParam(
                                                            FFAppState()
                                                                .nextslug,
                                                            ParamType.String,
                                                          ),
                                                          'nextsort':
                                                              serializeParam(
                                                            FFAppState()
                                                                .nextsort,
                                                            ParamType.int,
                                                          ),
                                                          'slug':
                                                              serializeParam(
                                                            FFAppState().slug,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      if (FFAppState()
                                                              .nextslug ==
                                                          'send_sms') {
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                          'SigningSms',
                                                          queryParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              FFAppState().slug,
                                                              ParamType.String,
                                                            ),
                                                            'nextslug':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .nextslug,
                                                              ParamType.String,
                                                            ),
                                                            'nextsort':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .nextsort,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        if (FFAppState()
                                                                .nextslug ==
                                                            'check_report') {
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                            'proverka-ankety',
                                                            queryParameters: {
                                                              'slug':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .slug,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'nextslug':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nextslug,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'nextsort':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .nextsort,
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
                                            },
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'ORDER_PAGE_НАЧАТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                await HappyTestAPIGroup
                                                    .statusCall
                                                    .call(
                                                  slug: widget.slug,
                                                  status: 'nacat-vstrecu',
                                                  token: FFAppState().Token,
                                                );
                                                logFirebaseEvent(
                                                    'Button_update_app_state');
                                                FFAppState().nextslug = '0';
                                                FFAppState().nextsort = 0;
                                                FFAppState().bankName =
                                                    HappyTestAPIGroup.orderCall
                                                        .bank(
                                                  orderOrderResponse.jsonBody,
                                                )!;
                                                logFirebaseEvent(
                                                    'Button_action_block');
                                                await action_blocks
                                                    .mainAction(context);
                                              },
                                              text: 'НАЧАТЬ ВСТРЕЧУ',
                                              options: FFButtonOptions(
                                                width: 327.0,
                                                height: 48.0,
                                                padding: const EdgeInsets.all(0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.6,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.5,
                                                        ),
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 15.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_ОТМЕНИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().status =
                                                  HappyTestAPIGroup.orderCall
                                                      .statusslug(
                                                orderOrderResponse.jsonBody,
                                              )!;
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'status',
                                                queryParameters: {
                                                  'slug': serializeParam(
                                                    widget.slug,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'ОТМЕНИТЬ ВСТРЕЧУ',
                                            options: FFButtonOptions(
                                              width: 327.0,
                                              height: 48.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEAEAEA),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: const Color(0xFF5F5F5F),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                // status meeting_confirmed "Встреча подтверждена"
                                if ((HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'denied') ||
                                    (HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'denied') ||
                                    (HappyTestAPIGroup.orderCall.statusslug(
                                          orderOrderResponse.jsonBody,
                                        ) ==
                                        'waiting_verification'))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 15.0, 24.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onDoubleTap: () async {
                                            logFirebaseEvent(
                                                'ORDER_ПРОДОЛЖИТЬ_ВСТРЕЧУ_BTN_ON_DOUBLE_T');
                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            await HappyTestAPIGroup.statusCall
                                                .call(
                                              slug: widget.slug,
                                              status: 'nacat-vstrecu',
                                              token: FFAppState().Token,
                                            );
                                            if (FFAppState().nextslug ==
                                                'show_agreement') {
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'ShowAgreement',
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
                                            } else {
                                              if (FFAppState().nextslug ==
                                                  'photos') {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'Photos',
                                                  queryParameters: {
                                                    'slug': serializeParam(
                                                      widget.slug,
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
                                              } else {
                                                if (FFAppState().nextslug ==
                                                    'wire_card') {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                    'BindingAll',
                                                    queryParameters: {
                                                      'nextslug':
                                                          serializeParam(
                                                        FFAppState().nextslug,
                                                        ParamType.String,
                                                      ),
                                                      'nextsort':
                                                          serializeParam(
                                                        FFAppState().nextsort,
                                                        ParamType.int,
                                                      ),
                                                      'slug': serializeParam(
                                                        FFAppState().slug,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (FFAppState().nextslug ==
                                                      'wire_card') {
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                      'BindingAll',
                                                      queryParameters: {
                                                        'nextslug':
                                                            serializeParam(
                                                          FFAppState().nextslug,
                                                          ParamType.String,
                                                        ),
                                                        'nextsort':
                                                            serializeParam(
                                                          FFAppState().nextsort,
                                                          ParamType.int,
                                                        ),
                                                        'slug': serializeParam(
                                                          FFAppState().slug,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    if (FFAppState().nextslug ==
                                                        'send_sms') {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        'SigningSms',
                                                        queryParameters: {
                                                          'slug':
                                                              serializeParam(
                                                            FFAppState().slug,
                                                            ParamType.String,
                                                          ),
                                                          'nextslug':
                                                              serializeParam(
                                                            FFAppState()
                                                                .nextslug,
                                                            ParamType.String,
                                                          ),
                                                          'nextsort':
                                                              serializeParam(
                                                            FFAppState()
                                                                .nextsort,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      if (FFAppState()
                                                              .nextslug ==
                                                          'check_report') {
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

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
                                                              FFAppState()
                                                                  .nextslug,
                                                              ParamType.String,
                                                            ),
                                                            'nextsort':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .nextsort,
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
                                          },
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_ПРОДОЛЖИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await HappyTestAPIGroup.statusCall
                                                  .call(
                                                slug: widget.slug,
                                                status: 'nacat-vstrecu',
                                                token: FFAppState().Token,
                                              );
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().nextslug = '0';
                                              FFAppState().nextsort = 0;
                                              FFAppState().bankName =
                                                  HappyTestAPIGroup.orderCall
                                                      .bank(
                                                orderOrderResponse.jsonBody,
                                              )!;
                                              logFirebaseEvent(
                                                  'Button_action_block');
                                              await action_blocks
                                                  .mainAction(context);
                                            },
                                            text: 'ПРОДОЛЖИТЬ ВСТРЕЧУ',
                                            options: FFButtonOptions(
                                              width: 327.0,
                                              height: 48.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
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
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ),

                                      // ?выскакивает, когда в Dop нажимают Завершить
                                      if ((HappyTestAPIGroup.orderCall.status(
                                                orderOrderResponse.jsonBody,
                                              ) ==
                                              'Верификация пройдена') ||
                                          (HappyTestAPIGroup.orderCall.status(
                                                orderOrderResponse.jsonBody,
                                              ) ==
                                              'Верификация не пройдена'))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 15.0, 24.0, 32.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_ЗАВЕРШИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiResultntr =
                                                  await HappyTestAPIGroup
                                                      .statusCall
                                                      .call(
                                                token: FFAppState().Token,
                                                slug: FFAppState().slug,
                                                status: 'zaversit-vstrecu',
                                              );
                                              if (!(_model.apiResultntr
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'status',
                                                  queryParameters: {
                                                    'slug': serializeParam(
                                                      widget.slug,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }

                                              setState(() {});
                                            },
                                            text: 'ЗАВЕРШИТЬ ВСТРЕЧУ',
                                            options: FFButtonOptions(
                                              width: 327.0,
                                              height: 48.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),

                                      // ?выскакивает, когда в Dop нажимают Завершить
                                      if ((HappyTestAPIGroup.orderCall.status(
                                                orderOrderResponse.jsonBody,
                                              ) ==
                                              'Верификация пройдена') ||
                                          (HappyTestAPIGroup.orderCall.status(
                                                orderOrderResponse.jsonBody,
                                              ) ==
                                              'Завершить встречу'))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 15.0, 24.0, 32.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_ЗАВЕРШИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiStat =
                                                  await HappyTestAPIGroup
                                                      .statusCall
                                                      .call(
                                                token: FFAppState().Token,
                                                slug: FFAppState().slug,
                                                status: 'zaversit-vstrecu',
                                              );
                                              if (!(_model.apiStat?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'status',
                                                  queryParameters: {
                                                    'slug': serializeParam(
                                                      widget.slug,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }

                                              setState(() {});
                                            },
                                            text: 'ЗАВЕРШИТЬ ВСТРЕЧУ',
                                            options: FFButtonOptions(
                                              width: 327.0,
                                              height: 48.0,
                                              padding: const EdgeInsets.all(0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEAEAEA),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: const Color(0xFF5F5F5F),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
