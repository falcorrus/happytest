import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_list_model.dart';
export 'orders_list_model.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({Key? key}) : super(key: key);

  @override
  _OrdersListWidgetState createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget>
    with TickerProviderStateMixin {
  late OrdersListModel _model;

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
    _model = createModel(context, () => OrdersListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'OrdersList'});

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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  icon: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('ORDERS_LIST_PAGE_IconButtonBack_ON_TAP');
                    logFirebaseEvent('IconButtonBack_update_app_state');
                    FFAppState().deleteToken();
                    FFAppState().Token = '';

                    logFirebaseEvent('IconButtonBack_navigate_to');

                    context.pushNamed('Login');
                  },
                ),
              ),
              title: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Text(
                  'Мои заявки',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Montserrat',
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 30.0,
                    borderWidth: 0.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.refresh,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('ORDERS_LIST_PAGE_refresh_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_backend_call');
                      _model.apiResultOrdersCopy =
                          await HappyTestAPIGroup.ordersCall.call(
                        token: FFAppState().Token,
                      );
                      // просто обновляю страницу, чтобы подгруженные данные  из БД отобразились.
                      logFirebaseEvent('IconButton_update_app_state');
                      setState(() {});
                      logFirebaseEvent('IconButton_navigate_to');

                      context.goNamed(
                        'OrdersList',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );

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
              return Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.logout,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ORDERS_LIST_PAGE_logout_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().deleteToken();
                                  FFAppState().Token = '';

                                  logFirebaseEvent('IconButton_navigate_to');

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
                                      await HappyTestAPIGroup.userCall.call(
                                    token: FFAppState().Token,
                                  );
                                  logFirebaseEvent('Text_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Версия от 1 сентября 2023   ${getJsonField(
                                          (_model.apiAgent?.jsonBody ?? ''),
                                          r'''$.name''',
                                        ).toString()}',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );

                                  setState(() {});
                                },
                                child: Text(
                                  '                                                         ',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.refresh,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ORDERS_LIST_PAGE_refresh_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_backend_call');
                                  _model.apiResultOrders =
                                      await HappyTestAPIGroup.ordersCall.call(
                                    token: FFAppState().Token,
                                  );
                                  // просто обновляю страницу, чтобы подгруженные данные  из БД отобразились.
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  setState(() {});
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamed(
                                    'OrdersList',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 300),
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
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

                                      context.pushNamed('BindingOtkrytie');
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
                      if (FFAppState().workDone)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeIn,
                            width: 329.0,
                            height: 32.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ORDERS_LIST_PAGE_Button-inWork_ON_TAP');
                                      logFirebaseEvent(
                                          'Button-inWork_update_app_state');
                                      setState(() {
                                        FFAppState().workDone = true;
                                      });
                                    },
                                    text: 'В работе',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 9.0, 0.0, 9.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFEFEFF4),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFEFEFF4),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.only(
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
                                          'Button-one_update_app_state');
                                      setState(() {
                                        FFAppState().workDone = false;
                                      });
                                    },
                                    text: 'Выполнено',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 9.0, 0.0, 9.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(16.0),
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
                      if (!FFAppState().workDone)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            width: 329.0,
                            height: 32.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ORDERS_LIST_PAGE_Button-inWork_ON_TAP');
                                      logFirebaseEvent(
                                          'Button-inWork_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().workDone = true;
                                      });
                                    },
                                    text: 'В работе',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 9.0, 0.0, 9.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.only(
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
                                          'Button-one_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().workDone = false;
                                      });
                                    },
                                    text: 'Выполнено',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 9.0, 0.0, 9.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFEFEFF4),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFEFEFF4),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(16.0),
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
                      if (FFAppState().workDone)
                        FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??= Completer<
                                  ApiCallResponse>()
                                ..complete(HappyTestAPIGroup.ordersCall.call(
                                  token: FFAppState().Token,
                                )))
                              .future,
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
                            final listViewListOrdersOrdersResponse =
                                snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final data = HappyTestAPIGroup.ordersCall
                                        .data(
                                          listViewListOrdersOrdersResponse
                                              .jsonBody,
                                        )
                                        ?.toList() ??
                                    [];
                                if (data.isEmpty) {
                                  return Center(
                                    child: EmptyListWidget(),
                                  );
                                }
                                return RefreshIndicator(
                                  onRefresh: () async {
                                    logFirebaseEvent(
                                        'ORDERS_LIST_ListView-listOrders_ON_PULL_');
                                    logFirebaseEvent(
                                        'ListView-listOrders_refresh_database_req');
                                    setState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.length,
                                    itemBuilder: (context, dataIndex) {
                                      final dataItem = data[dataIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 20.0, 15.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.easeIn,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFFEFEFF4),
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
                                                  padding: EdgeInsetsDirectional
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
                                                                EdgeInsetsDirectional
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
                                                                  ).toString(),
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
                                                              ).toString(),
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
                                                              EdgeInsetsDirectional
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
                                                              ).toString(),
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
                                                                  color: Color(
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
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                              ).toString(),
                                                              'error',
                                                            )} - ${valueOrDefault<String>(
                                                              getJsonField(
                                                                dataItem,
                                                                r'''$.finish''',
                                                              ).toString(),
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
                                                                color: Color(
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
                                                          EdgeInsetsDirectional
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
                                                          Icons
                                                              .document_scanner_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                          size: 18.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ORDERS_LIST_document_scanner_outlined_IC');
                                                          logFirebaseEvent(
                                                              'IconButton_backend_call');
                                                          _model.ord =
                                                              await HappyTestAPIGroup
                                                                  .orderCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .Token,
                                                            slug: getJsonField(
                                                              dataItem,
                                                              r'''$.slug''',
                                                            ).toString(),
                                                          );
                                                          if (!(_model.ord
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'IconButton_wait__delay');
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        2000));
                                                          }
                                                          logFirebaseEvent(
                                                              'IconButton_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                HappyTestAPIGroup
                                                                    .orderCall
                                                                    .pdf(
                                                                      (_model.ord
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'IconButton_wait__delay');
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      1000));
                                                          logFirebaseEvent(
                                                              'IconButton_launch_u_r_l');
                                                          await launchURL(
                                                              HappyTestAPIGroup
                                                                  .orderCall
                                                                  .pdf(
                                                                    (_model.ord
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  .toString());

                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
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
                                                              r'''$.client.address''',
                                                            ).toString(),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
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
                                                              EdgeInsetsDirectional
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
                                                                ).toString(),
                                                                'ыва',
                                                              )} ${valueOrDefault<String>(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.client.firstname''',
                                                                ).toString(),
                                                                'нет',
                                                              )} ${valueOrDefault<String>(
                                                                getJsonField(
                                                                  dataItem,
                                                                  r'''$.client.middlename''',
                                                                ).toString(),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
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
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      1.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              dataItem,
                                                              r'''$.product.name''',
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
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'listViewOnPageLoadAnimation']!);
                              },
                            );
                          },
                        ),
                      if (!FFAppState().workDone)
                        FutureBuilder<ApiCallResponse>(
                          future: HappyTestAPIGroup.ordershistoryCall.call(
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
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
                                  return Center(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 32.0, 24.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.easeIn,
                                          width: 328.0,
                                          height: 146.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFFEFEFF4),
                                            ),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ORDERS_LIST_PAGE_Column_oicp5l8r_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                'Order',
                                                queryParameters: {
                                                  'slug': serializeParam(
                                                    getJsonField(
                                                      responseItem,
                                                      r'''$.slug''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 20.0, 0.0, 0.0),
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        14.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.circle,
                                                              color: Color(
                                                                  0xFFFFD600),
                                                              size: 12.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                responseItem,
                                                                r'''$.status.name''',
                                                              ).toString(),
                                                              'error',
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            responseItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFC6C6C6),
                                                                fontSize: 10.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${valueOrDefault<String>(
                                                              getJsonField(
                                                                responseItem,
                                                                r'''$.start''',
                                                              ).toString(),
                                                              'error',
                                                            )} - ${valueOrDefault<String>(
                                                              getJsonField(
                                                                responseItem,
                                                                r'''$.finish''',
                                                              ).toString(),
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
                                                                color: Color(
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
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            responseItem,
                                                            r'''$.address''',
                                                          ).toString(),
                                                          'error',
                                                        ),
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
                                                              lineHeight: 1.21,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    1.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${getJsonField(
                                                              responseItem,
                                                              r'''$.client.lastname''',
                                                            ).toString()} ${getJsonField(
                                                              responseItem,
                                                              r'''$.client.firstname''',
                                                            ).toString()} ${getJsonField(
                                                              responseItem,
                                                              r'''$.client.middlename''',
                                                            ).toString()}',
                                                            'error',
                                                          ),
                                                          maxLines: 2,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
