import '/backend/api_requests/api_calls.dart';
import '/components/row_back_back/row_back_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'map_points_model.dart';
export 'map_points_model.dart';

class MapPointsWidget extends StatefulWidget {
  const MapPointsWidget({super.key});

  @override
  _MapPointsWidgetState createState() => _MapPointsWidgetState();
}

class _MapPointsWidgetState extends State<MapPointsWidget> {
  late MapPointsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPointsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MapPoints'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAP_POINTS_PAGE_MapPoints_ON_INIT_STATE');
      logFirebaseEvent('MapPoints_custom_action');
      _model.url = await actions.returnString(
        FFAppState().yandexAPIUrl,
        FFAppState().listAppstate.toList(),
      );
      // string2imagePath
      logFirebaseEvent('MapPoints_string2imagePath');
      _model.imageFromURL = await actions.imagePath(
        _model.url!,
      );
      logFirebaseEvent('MapPoints_update_page_state');
      setState(() {
        _model.stringURL = _model.imageFromURL;
      });
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
      future: HappyTestAPIGroup.ordersCall.call(
        token: FFAppState().Token,
        today: functions.currentDate(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final mapPointsOrdersResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: wrapWithModel(
                    model: _model.rowBackBackModel,
                    updateCallback: () => setState(() {}),
                    child: const RowBackBackWidget(),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  SelectionArea(
                      child: Text(
                    valueOrDefault<String>(
                      _model.url,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  )),
                Builder(
                  builder: (context) {
                    final addrs = HappyTestAPIGroup.ordersCall
                            .adres(
                              mapPointsOrdersResponse.jsonBody,
                            )
                            ?.toList() ??
                        [];
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        10.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: addrs.length,
                      itemBuilder: (context, addrsIndex) {
                        final addrsItem = addrs[addrsIndex];
                        return Text(
                          addrsItem,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        );
                      },
                    );
                  },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    _model.stringURL!,
                    width: double.infinity,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
