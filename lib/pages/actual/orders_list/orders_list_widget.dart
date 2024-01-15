import '/backend/api_requests/api_calls.dart';
import '/components/drawer_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'orders_list_model.dart';
export 'orders_list_model.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});

  @override
  _OrdersListWidgetState createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget>
    with TickerProviderStateMixin {
  late OrdersListModel _model;

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
    'listViewOnPageLoadAnimation1': AnimationInfo(
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
    'listViewOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'OrdersList'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ORDERS_LIST_OrdersList_ON_INIT_STATE');
      logFirebaseEvent('OrdersList_update_page_state');
      _model.isWork = true;
    });

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
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(HappyTestAPIGroup.ordersCall.call(
              token: FFAppState().Token,
              today: functions.currentDate(),
            )))
          .future,
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
        final ordersListOrdersResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FFAppConstants.background,
            drawer: SizedBox(
              width: 260.0,
              child: Drawer(
                elevation: 16.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.drawerModel,
                          updateCallback: () => setState(() {}),
                          child: const DrawerWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: true,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ORDERS_LIST_PAGE_Text_itooijqf_ON_TAP');
                        logFirebaseEvent('Text_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              FFAppConstants.appVersion,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                      onLongPress: () async {
                        logFirebaseEvent(
                            'ORDERS_LIST_Text_itooijqf_ON_LONG_PRESS');
                        logFirebaseEvent('Text_navigate_to');

                        context.pushNamed('Login');
                      },
                      child: Text(
                        FFAppConstants.appName,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                  title: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('ORDERS_LIST_PAGE_Text-Name_ON_TAP');
                        logFirebaseEvent('Text-Name_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              FFAppConstants.appVersion,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                      child: Text(
                        'Мои заявки ',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.menu,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: (_model.push == true)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'ORDERS_LIST_PAGE_IconButton-right_ON_TAP');
                                if (HappyTestAPIGroup.ordersCall
                                        .adres(
                                          ordersListOrdersResponse.jsonBody,
                                        )!.isNotEmpty) {
                                  // создаем PageState, в который записываем ВСЕ адреса из Orders (string)
                                  logFirebaseEvent(
                                      'IconButton-right_update_page_state');
                                  _model.stringAdress =
                                      HappyTestAPIGroup.ordersCall
                                          .adres(
                                            ordersListOrdersResponse.jsonBody,
                                          )!
                                          .toList()
                                          .cast<String>();
                                  if (_model.stringAdress.isNotEmpty) {
                                    while (_model.stringAdress.isNotEmpty) {
                                      logFirebaseEvent(
                                          'IconButton-right_backend_call');
                                      _model.returnGeo =
                                          await YandexNewCall.call(
                                        geokode: _model.stringAdress.first,
                                      );
                                      if ((_model.returnGeo?.succeeded ??
                                          true)) {
                                        // AddToList
                                        logFirebaseEvent(
                                            'IconButton-right_AddToList');
                                        FFAppState().addToListAppstate(functions
                                            .latLongJSON(YandexNewCall.latLong(
                                          (_model.returnGeo?.jsonBody ?? ''),
                                        )!
                                                .toList()));
                                        logFirebaseEvent(
                                            'IconButton-right_show_snack_bar');
                                        // RemoveFromList
                                        logFirebaseEvent(
                                            'IconButton-right_RemoveFromList');
                                        _model.removeFromStringAdress(
                                            _model.stringAdress.first);
                                        logFirebaseEvent(
                                            'IconButton-right_update_app_state');
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton-right_update_page_state');
                                        _model.removeFromStringAdress(
                                            _model.stringAdress.first);
                                        logFirebaseEvent(
                                            'IconButton-right_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Заявок не найдено',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 3449),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    }
                                    logFirebaseEvent('IconButton-right_drawer');
                                    scaffoldKey.currentState!.openDrawer();
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton-right_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'адресов 0',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    logFirebaseEvent('IconButton-right_drawer');
                                    scaffoldKey.currentState!.openDrawer();
                                  }
                                } else {
                                  logFirebaseEvent('IconButton-right_drawer');
                                  scaffoldKey.currentState!.openDrawer();
                                }

                                setState(() {});
                              },
                      ),
                    ),
                  ],
                  centerTitle: false,
                  toolbarHeight: 48.0,
                  elevation: 0.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn,
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Opacity(
                                opacity: 0.0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.logout,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ORDERS_LIST_PAGE_logout_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        FFAppState().Token = '';
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.pushNamed('Login');
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ORDERS_LIST_PAGE_Text_amqbtuzi_ON_TAP');
                                        logFirebaseEvent('Text_backend_call');
                                        _model.apiAgent =
                                            await HappyTestAPIGroup.userCall
                                                .call(
                                          token: FFAppState().Token,
                                        );
                                        logFirebaseEvent('Text_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Версия от 1 сентября 2023   ${getJsonField(
                                                (_model.apiAgent?.jsonBody ??
                                                    ''),
                                                r'''$.name''',
                                              ).toString()}',
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

                                        setState(() {});
                                      },
                                      child: Text(
                                        '                                                         ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.refresh,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ORDERS_LIST_PAGE_refresh_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_backend_call');
                                        _model.apiResultOrders =
                                            await HappyTestAPIGroup.ordersCall
                                                .call(
                                          token: FFAppState().Token,
                                        );
                                        // просто обновляю страницу, чтобы подгруженные данные  из БД отобразились.
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        setState(() {});
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.goNamed(
                                          'OrdersList',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                            ),
                                          },
                                        );

                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Opacity(
                                opacity: 0.0,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ORDERS_LIST_PAGE_Text-Orders_ON_TAP');
                                            logFirebaseEvent(
                                                'Text-Orders_navigate_to');

                                            context.pushNamed('BindingAll');
                                          },
                                          child: Text(
                                            'Мои заявки',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 28.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (_model.isWork ?? true)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 24.0, 15.0, 0.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeIn,
                                  height: 32.0,
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onLongPress: () async {
                                            logFirebaseEvent(
                                                'ORDERS_LIST_Button-inWork_ON_LONG_PRESS');
                                            logFirebaseEvent(
                                                'Button-inWork_refresh_database_request');
                                            setState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                          },
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDERS_LIST_PAGE_Button-inWork_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button-inWork_update_page_state');
                                              setState(() {
                                                _model.isWork = true;
                                              });
                                            },
                                            text: 'В работе',
                                            options: FFButtonOptions(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 9.0, 0.0, 9.0),
                                              iconPadding: const EdgeInsets.all(0.0),
                                              color: const Color(0xFFEFEFF4),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.1,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Color(0xFFEFEFF4),
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ORDERS_LIST_PAGE_Button-one_ON_TAP');
                                            logFirebaseEvent(
                                                'Button-one_update_page_state');
                                            setState(() {
                                              _model.isWork = false;
                                            });
                                          },
                                          text: 'Выполнено',
                                          options: FFButtonOptions(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 9.0, 0.0, 9.0),
                                            iconPadding: const EdgeInsets.all(0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.1,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight:
                                                  Radius.circular(16.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (!_model.isWork!)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 24.0, 15.0, 0.0),
                                child: Container(
                                  height: 32.0,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ORDERS_LIST_PAGE_Button-inWork_ON_TAP');
                                            logFirebaseEvent(
                                                'Button-inWork_update_page_state');
                                            setState(() {
                                              _model.isWork = true;
                                            });
                                          },
                                          text: 'В работе',
                                          options: FFButtonOptions(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 9.0, 0.0, 9.0),
                                            iconPadding: const EdgeInsets.all(0.0),
                                            color: Colors.white,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.1,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(16.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ORDERS_LIST_PAGE_Button-one_ON_TAP');
                                            logFirebaseEvent(
                                                'Button-one_update_page_state');
                                            setState(() {
                                              _model.isWork = false;
                                            });
                                          },
                                          text: 'Выполнено',
                                          options: FFButtonOptions(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 9.0, 0.0, 9.0),
                                            iconPadding: const EdgeInsets.all(0.0),
                                            color: const Color(0xFFEFEFF4),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFFEFEFF4),
                                              width: 1.0,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight:
                                                  Radius.circular(16.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (_model.isWork ?? true)
                              Builder(
                                builder: (context) {
                                  final data = HappyTestAPIGroup.ordersCall
                                          .data(
                                            ordersListOrdersResponse.jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                                  if (data.isEmpty) {
                                    return const Center(
                                      child: EmptyListWidget(),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.length,
                                    itemBuilder: (context, dataIndex) {
                                      final dataItem = data[dataIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 20.0, 15.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.easeIn,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                                  'ORDERS_LIST_PAGE_Column_5av4603z_ON_TAP');
                                              // isPesronal чистим от предыдущих заявок
                                              logFirebaseEvent(
                                                  'Column_update_app_state');
                                              FFAppState().isPersonal = false;
                                              logFirebaseEvent(
                                                  'Column_update_app_state');
                                              FFAppState().slug = getJsonField(
                                                dataItem,
                                                r'''$.slug''',
                                              ).toString();
                                              FFAppState().prodslug =
                                                  getJsonField(
                                                dataItem,
                                                r'''$.product.slug''',
                                              );
                                              FFAppState().clientTel =
                                                  getJsonField(
                                                dataItem,
                                                r'''$.client.phone''',
                                              ).toString();
                                              if (getJsonField(
                                                    dataItem,
                                                    r'''$.data.is_personal''',
                                                  ) !=
                                                  null) {
                                                logFirebaseEvent(
                                                    'Column_update_app_state');
                                                FFAppState().isPersonal =
                                                    getJsonField(
                                                  dataItem,
                                                  r'''$.data.is_personal''',
                                                );
                                              } else {
                                                // isPesronal чистим от предыдущих заявок
                                                logFirebaseEvent(
                                                    'Column_update_app_state');
                                                FFAppState().isPersonal = false;
                                              }

                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                'Order',
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
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        14.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.circle,
                                                              color:
                                                                  colorFromCssString(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    dataItem,
                                                                    r'''$.status.color''',
                                                                  )?.toString(),
                                                                  'black',
                                                                ),
                                                                defaultColor:
                                                                    Colors
                                                                        .black,
                                                              ),
                                                              size: 12.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                dataItem,
                                                                r'''$.status.name''',
                                                              )?.toString(),
                                                              'статус name',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.21,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                dataItem,
                                                                r'''$.id''',
                                                              )?.toString(),
                                                              'id',
                                                            ),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: const Color(
                                                                      0xFFC6C6C6),
                                                                  fontSize:
                                                                      10.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${valueOrDefault<String>(
                                                              getJsonField(
                                                                dataItem,
                                                                r'''$.start''',
                                                              )?.toString(),
                                                              'error',
                                                            )} - ${valueOrDefault<String>(
                                                              getJsonField(
                                                                dataItem,
                                                                r'''$.finish''',
                                                              )?.toString(),
                                                              'error',
                                                            )}',
                                                            'error',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: const Color(
                                                                    0xFF4460F0),
                                                                fontSize: 28.0,
                                                                letterSpacing:
                                                                    0.1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                lineHeight:
                                                                    1.22,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 30.0,
                                                        icon: Icon(
                                                          Icons.content_paste,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ORDERS_LIST_content_paste_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_navigate_to');

                                                          context.pushNamed(
                                                            'bankDocs',
                                                            queryParameters: {
                                                              'agentSlug':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.agent.slug''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'customerId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.CustomerId''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'orderId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    14.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .person_pin_circle,
                                                          color:
                                                              Color(0xFFB1B1B1),
                                                          size: 15.0,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              dataItem,
                                                              r'''$.address''',
                                                            )?.toString(),
                                                            'адрес',
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight:
                                                                    1.21,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    14.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .person_outline_outlined,
                                                          color:
                                                              Color(0xFFB1B1B1),
                                                          size: 15.0,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      1.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '${valueOrDefault<String>(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.client.lastname''',
                                                                )?.toString(),
                                                                'ыва',
                                                              )} ${valueOrDefault<String>(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.client.firstname''',
                                                                )?.toString(),
                                                                'нет',
                                                              )} ${valueOrDefault<String>(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.client.middlename''',
                                                                )?.toString(),
                                                                'нет ',
                                                              )}',
                                                              'error',
                                                            ),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.21,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    14.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .production_quantity_limits,
                                                          color:
                                                              Color(0xFFB1B1B1),
                                                          size: 15.0,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      1.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                                      dataItem,
                                                                      r'''$.product.name''',
                                                                    ) !=
                                                                    null
                                                                ? getJsonField(
                                                                    dataItem,
                                                                    r'''$.product.name''',
                                                                  ).toString()
                                                                : getJsonField(
                                                                    dataItem,
                                                                    r'''$.product.code''',
                                                                  ).toString(),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  lineHeight:
                                                                      1.21,
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
                                      );
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'listViewOnPageLoadAnimation1']!);
                                },
                              ),
                            if (_model.isWork ?? true)
                              FutureBuilder<ApiCallResponse>(
                                future: HappyTestAPIGroup.ordersVerifCall.call(
                                  token: FFAppState().Token,
                                  statusCodes: 'denied',
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listVievInVerifOrdersVerifResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final dataVerif =
                                          HappyTestAPIGroup.ordersVerifCall
                                                  .data(
                                                    listVievInVerifOrdersVerifResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: dataVerif.length,
                                        itemBuilder: (context, dataVerifIndex) {
                                          final dataVerifItem =
                                              dataVerif[dataVerifIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 20.0, 15.0, 0.0),
                                            child: AnimatedContainer(
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.easeIn,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: const Color(0xFFEFEFF4),
                                                ),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ORDERS_LIST_PAGE_Column_lzi7dxrz_ON_TAP');
                                                  // isPesronal чистим от предыдущих заявок
                                                  logFirebaseEvent(
                                                      'Column_update_app_state');
                                                  FFAppState().isPersonal =
                                                      false;
                                                  logFirebaseEvent(
                                                      'Column_update_app_state');
                                                  FFAppState().slug =
                                                      getJsonField(
                                                    dataVerifItem,
                                                    r'''$.slug''',
                                                  ).toString();
                                                  FFAppState().prodslug =
                                                      getJsonField(
                                                    dataVerifItem,
                                                    r'''$.product.slug''',
                                                  );
                                                  FFAppState().clientTel =
                                                      getJsonField(
                                                    dataVerifItem,
                                                    r'''$.client.phone''',
                                                  ).toString();
                                                  if (getJsonField(
                                                        dataVerifItem,
                                                        r'''$.data.is_personal''',
                                                      ) !=
                                                      null) {
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    FFAppState().isPersonal =
                                                        getJsonField(
                                                      dataVerifItem,
                                                      r'''$.data.is_personal''',
                                                    );
                                                  } else {
                                                    // isPesronal чистим от предыдущих заявок
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    FFAppState().isPersonal =
                                                        false;
                                                  }

                                                  logFirebaseEvent(
                                                      'Column_update_app_state');
                                                  // теоретически можно объединить в одну линию
                                                  logFirebaseEvent(
                                                      'Column_backend_call');
                                                  logFirebaseEvent(
                                                      'Column_update_app_state');
                                                  logFirebaseEvent(
                                                      'Column_update_page_state');
                                                  logFirebaseEvent(
                                                      'Column_navigate_to');

                                                  context.pushNamed(
                                                    'Order',
                                                    queryParameters: {
                                                      'slug': serializeParam(
                                                        FFAppState().slug,
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
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            14.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons.circle,
                                                                  color:
                                                                      colorFromCssString(
                                                                    getJsonField(
                                                                      listVievInVerifOrdersVerifResponse
                                                                          .jsonBody,
                                                                      r'''$.status.color''',
                                                                    ).toString(),
                                                                    defaultColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                  size: 12.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  dataVerifItem,
                                                                  r'''$.status.name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.21,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  dataVerifItem,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: const Color(
                                                                          0xFFC6C6C6),
                                                                      fontSize:
                                                                          10.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '${getJsonField(
                                                                  dataVerifItem,
                                                                  r'''$.start''',
                                                                ).toString()} - ${getJsonField(
                                                                  dataVerifItem,
                                                                  r'''$.finish''',
                                                                ).toString()}',
                                                                'error',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: const Color(
                                                                        0xFF4460F0),
                                                                    fontSize:
                                                                        28.0,
                                                                    letterSpacing:
                                                                        0.1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    lineHeight:
                                                                        1.22,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    30.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .text_fields,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ORDERS_LIST_PAGE_text_fields_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'Верификатор:'),
                                                                        content:
                                                                            Text(valueOrDefault<String>(
                                                                          getJsonField(
                                                                            dataVerifItem,
                                                                            r'''$.comment''',
                                                                          )?.toString(),
                                                                          'Сообщения нет',
                                                                        )),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                const Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    30.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .content_paste,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ORDERS_LIST_content_paste_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'bankDocs',
                                                                    queryParameters:
                                                                        {
                                                                      'agentSlug':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listVievInVerifOrdersVerifResponse
                                                                              .jsonBody,
                                                                          r'''$.agent.slug''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'customerId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listVievInVerifOrdersVerifResponse
                                                                              .jsonBody,
                                                                          r'''$.CustomerId''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'orderId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listVievInVerifOrdersVerifResponse
                                                                              .jsonBody,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        14.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .person_pin_circle,
                                                              color: Color(
                                                                  0xFFB1B1B1),
                                                              size: 15.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              getJsonField(
                                                                dataVerifItem,
                                                                r'''$.address''',
                                                              ).toString(),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    lineHeight:
                                                                        1.21,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        14.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .person_outline_outlined,
                                                              color: Color(
                                                                  0xFFB1B1B1),
                                                              size: 15.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${getJsonField(
                                                                    dataVerifItem,
                                                                    r'''$.client.lastname''',
                                                                  ).toString()} ${getJsonField(
                                                                    dataVerifItem,
                                                                    r'''$.client.firstname''',
                                                                  ).toString()} ${getJsonField(
                                                                    dataVerifItem,
                                                                    r'''$.client.middlename''',
                                                                  ).toString()}',
                                                                  'error',
                                                                ),
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.21,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        14.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .production_quantity_limits,
                                                              color: Color(
                                                                  0xFFB1B1B1),
                                                              size: 15.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                          dataVerifItem,
                                                                          r'''$.product.name''',
                                                                        ) !=
                                                                        null
                                                                    ? getJsonField(
                                                                        dataVerifItem,
                                                                        r'''$.product.name''',
                                                                      ).toString()
                                                                    : getJsonField(
                                                                        dataVerifItem,
                                                                        r'''$.product.name''',
                                                                      ).toString(),
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.21,
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
                                          );
                                        },
                                      ).animateOnPageLoad(animationsMap[
                                          'listViewOnPageLoadAnimation2']!);
                                    },
                                  );
                                },
                              ),
                            if (!_model.isWork!)
                              FutureBuilder<ApiCallResponse>(
                                future:
                                    HappyTestAPIGroup.ordershistoryCall.call(
                                  token: FFAppState().Token,
                                  isFinished: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewListOrdersDoneOrdershistoryResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final response =
                                          HappyTestAPIGroup.ordershistoryCall
                                                  .data(
                                                    listViewListOrdersDoneOrdershistoryResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      if (response.isEmpty) {
                                        return const Center(
                                          child: EmptyListWidget(),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: response.length,
                                        itemBuilder: (context, responseIndex) {
                                          final responseItem =
                                              response[responseIndex];
                                          return Visibility(
                                            visible:
                                                listViewListOrdersDoneOrdershistoryResponse !=
                                                    null,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 32.0, 24.0, 0.0),
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.easeIn,
                                                width: 328.0,
                                                height: 146.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: const Color(0xFFEFEFF4),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'ORDERS_LIST_PAGE_Column_5jb5eyv5_ON_TAP');
                                                    // isPesronal чистим от предыдущих заявок
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    FFAppState().isPersonal =
                                                        false;
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    FFAppState().slug =
                                                        getJsonField(
                                                      responseItem,
                                                      r'''$.slug''',
                                                    ).toString();
                                                    FFAppState().prodslug =
                                                        getJsonField(
                                                      responseItem,
                                                      r'''$.product.slug''',
                                                    );
                                                    FFAppState().clientTel =
                                                        getJsonField(
                                                      responseItem,
                                                      r'''$.client.phone''',
                                                    ).toString();
                                                    if (getJsonField(
                                                          responseItem,
                                                          r'''$.data.is_personal''',
                                                        ) !=
                                                        null) {
                                                      logFirebaseEvent(
                                                          'Column_update_app_state');
                                                      FFAppState().isPersonal =
                                                          getJsonField(
                                                        responseItem,
                                                        r'''$.data.is_personal''',
                                                      );
                                                    } else {
                                                      // isPesronal чистим от предыдущих заявок
                                                      logFirebaseEvent(
                                                          'Column_update_app_state');
                                                      FFAppState().isPersonal =
                                                          false;
                                                    }

                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    // теоретически можно объединить в одну линию
                                                    logFirebaseEvent(
                                                        'Column_backend_call');
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    logFirebaseEvent(
                                                        'Column_update_page_state');
                                                    logFirebaseEvent(
                                                        'Column_navigate_to');

                                                    context.pushNamed(
                                                      'Order',
                                                      queryParameters: {
                                                        'slug': serializeParam(
                                                          FFAppState().slug,
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
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color:
                                                                        colorFromCssString(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          responseItem,
                                                                          r'''$.status.color''',
                                                                        )?.toString(),
                                                                        'black',
                                                                      ),
                                                                      defaultColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                    size: 12.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      responseItem,
                                                                      r'''$.status.name''',
                                                                    )?.toString(),
                                                                    'статус name',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.1,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        lineHeight:
                                                                            1.21,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      responseItem,
                                                                      r'''$.id''',
                                                                    )?.toString(),
                                                                    'id',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: const Color(
                                                                            0xFFC6C6C6),
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${valueOrDefault<String>(
                                                                    getJsonField(
                                                                      responseItem,
                                                                      r'''$.start''',
                                                                    )?.toString(),
                                                                    'error',
                                                                  )} - ${getJsonField(
                                                                    responseItem,
                                                                    r'''$.finish''',
                                                                  ).toString()}',
                                                                  'error',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: const Color(
                                                                          0xFF4460F0),
                                                                      fontSize:
                                                                          28.0,
                                                                      letterSpacing:
                                                                          0.1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      lineHeight:
                                                                          1.22,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (functions.toBool(
                                                                  getJsonField(
                                                                responseItem,
                                                                r'''$.externalAgreement1''',
                                                              ).toString()) ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    30.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .content_paste,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                  size: 18.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ORDERS_LIST_content_paste_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');
                                                                  _model.ord1 =
                                                                      await HappyTestAPIGroup
                                                                          .orderCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .Token,
                                                                    slug:
                                                                        getJsonField(
                                                                      responseItem,
                                                                      r'''$.slug''',
                                                                    ).toString(),
                                                                  );
                                                                  if (!(_model
                                                                          .ord1
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'IconButton_wait__delay');
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            2000));
                                                                  }
                                                                  logFirebaseEvent(
                                                                      'IconButton_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        HappyTestAPIGroup
                                                                            .orderCall
                                                                            .pdf(
                                                                          (_model.ord1?.jsonBody ??
                                                                              ''),
                                                                        )!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'IconButton_launch_u_r_l');
                                                                  await launchURL(
                                                                      HappyTestAPIGroup
                                                                          .orderCall
                                                                          .pdf(
                                                                    (_model.ord1
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!);

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .person_pin_circle,
                                                                color: Color(
                                                                    0xFFB1B1B1),
                                                                size: 15.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    responseItem,
                                                                    r'''$.client.address''',
                                                                  )?.toString(),
                                                                  'адрес',
                                                                ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.1,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.21,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .person_outline_outlined,
                                                                color: Color(
                                                                    0xFFB1B1B1),
                                                                size: 15.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            1.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${valueOrDefault<String>(
                                                                      getJsonField(
                                                                        responseItem,
                                                                        r'''$.client.lastname''',
                                                                      )?.toString(),
                                                                      'ыва',
                                                                    )} ${getJsonField(
                                                                      responseItem,
                                                                      r'''$.client.firstname''',
                                                                    ).toString()} ${getJsonField(
                                                                      responseItem,
                                                                      r'''$.client.middlename''',
                                                                    ).toString()}',
                                                                    'error',
                                                                  ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.1,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        lineHeight:
                                                                            1.21,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          14.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .production_quantity_limits,
                                                                color: Color(
                                                                    0xFFB1B1B1),
                                                                size: 15.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            1.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                            responseItem,
                                                                            r'''$.product.name''',
                                                                          ) !=
                                                                          null
                                                                      ? getJsonField(
                                                                          responseItem,
                                                                          r'''$.product.name''',
                                                                        ).toString()
                                                                      : getJsonField(
                                                                          responseItem,
                                                                          r'''$.product.code''',
                                                                        ).toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.1,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        lineHeight:
                                                                            1.21,
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
                                          );
                                        },
                                      ).animateOnPageLoad(animationsMap[
                                          'listViewOnPageLoadAnimation3']!);
                                    },
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
