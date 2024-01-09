import '/backend/api_requests/api_calls.dart';
import '/components/row_back_back/row_back_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
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
      future: GoogleMapCall.call(
        address: 'Москва, новый арбат, 22',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        final mapPointsGoogleMapResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
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
                FlutterFlowWebView(
                  content:
                      '<!DOCTYPE html>\n<html>\n    <head>\n        <title>Пример с интерактивной картой</title>\n    </head>\n    <body>\n            <script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A053bd947d462cc1a45aeba4070defff75501905071c0eaf68436ac9976ec698c&amp;width=514&amp;height=626&amp;lang=ru_RU&amp;apikey=742bdd2e-d2a4-42f2-a457-f22c292ea02c"></script>\n        </div>\n    </body>\n</html>\n',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 500.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                  html: true,
                ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://static-maps.yandex.ru/v1?apikey=742bdd2e-d2a4-42f2-a457-f22c292ea02c&lang=ru_RU&pt=28.98624,41.043451~28.95624,41.043451,78~28.94114,41.043451,pmgrs~28.98124,41.043451,pm2rdm~28.97624,41.043451,pmntl100~28.965573,41.04311,pmors23~28.950111,41.043451,flag~28.969573,41.04311,pm2ywl99~37.608,55.6,round',
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
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
