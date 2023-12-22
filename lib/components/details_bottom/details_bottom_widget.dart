import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'details_bottom_model.dart';
export 'details_bottom_model.dart';

class DetailsBottomWidget extends StatefulWidget {
  const DetailsBottomWidget({super.key});

  @override
  _DetailsBottomWidgetState createState() => _DetailsBottomWidgetState();
}

class _DetailsBottomWidgetState extends State<DetailsBottomWidget> {
  late DetailsBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsBottomModel());

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

    return Container(
      width: 375.0,
      height: 309.0,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        boxShadow: const [
          BoxShadow(
            blurRadius: 27.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 4.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        border: Border.all(
          color: const Color(0xFFEFEFF4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DETAILS_BOTTOM_COMP_Row-back_ON_TAP');
                      logFirebaseEvent('Row-back_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: FlutterFlowIconButton(
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
                        Text(
                          'Назад',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 14.0, 0.0),
                          child: Icon(
                            Icons.circle,
                            color: Color(0xFFFFD600),
                            size: 12.0,
                          ),
                        ),
                        Text(
                          'Ожидает доставку',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.0,
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.21,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Text(
                        '№232-190222',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFFC6C6C6),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    '11:00 - 12:00',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
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
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'ул. Речная, д.14к1, кв. 171',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.21,
                          ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 22.0),
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
          ),
        ),
      ),
    );
  }
}
