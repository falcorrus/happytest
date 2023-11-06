import '/components/red_record/red_record_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'row_back_model.dart';
export 'row_back_model.dart';

class RowBackWidget extends StatefulWidget {
  const RowBackWidget({Key? key}) : super(key: key);

  @override
  _RowBackWidgetState createState() => _RowBackWidgetState();
}

class _RowBackWidgetState extends State<RowBackWidget> {
  late RowBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowBackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(-1.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 23.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('ROW_BACK_COMP_Row-back_ON_TAP');
            logFirebaseEvent('Row-back_navigate_back');
            context.pop();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.00, -1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 30.0,
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).secondaryText,
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
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.redRecordModel,
                updateCallback: () => setState(() {}),
                child: RedRecordWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
