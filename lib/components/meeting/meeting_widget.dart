import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'meeting_model.dart';
export 'meeting_model.dart';

class MeetingWidget extends StatefulWidget {
  const MeetingWidget({super.key});

  @override
  _MeetingWidgetState createState() => _MeetingWidgetState();
}

class _MeetingWidgetState extends State<MeetingWidget> {
  late MeetingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeetingModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('MEETING_COMP_Row-back_ON_TAP');
                logFirebaseEvent('Row-back_navigate_back');
                context.pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
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
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 0.0, 0.0),
            child: Text(
              'Отмена встречи',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Montserrat',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 16.0, 0.0, 0.0),
            child: Text(
              'Информация о встрече',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF868686),
                    fontSize: 18.0,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.2,
                  ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
            child: Text(
              'Название продукта',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
            child: Text(
              'Пакет документов',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
            child: Text(
              'Заказчик',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF868686),
                    fontSize: 10.0,
                    letterSpacing: 0.1,
                    lineHeight: 1.2,
                  ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 1.0, 0.0),
                child: Text(
                  'Янчевский Афанасий Ростиславович',
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
            child: Text(
              'Адрес',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 5.0, 0.0, 0.0),
            child: Text(
              'ул. Речная, д.14к1, кв. 171',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
            child: Text(
              'Номер телефона',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 5.0, 0.0, 0.0),
            child: Text(
              '+7 (954) 343 12 51',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
    );
  }
}
