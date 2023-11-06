import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future mainAction(BuildContext context) async {
  ApiCallResponse? apiNextModuleBlock;
  ApiCallResponse? order;
  ApiCallResponse? apiResultStatus;
  ApiCallResponse? apiResult6ag;

  logFirebaseEvent('mainAction_backend_call');
  apiNextModuleBlock = await HappyTestAPIGroup.nextmoduleCall.call(
    token: FFAppState().Token,
    productID: FFAppState().prodslug,
    code: FFAppState().nextslug,
    sort: FFAppState().nextsort,
    orderId: FFAppState().slug,
  );
  logFirebaseEvent('mainAction_update_app_state');
  FFAppState().nextslug = HappyTestAPIGroup.nextmoduleCall
      .code(
        (apiNextModuleBlock?.jsonBody ?? ''),
      )
      .toString();
  FFAppState().nextsort = HappyTestAPIGroup.nextmoduleCall.sort(
    (apiNextModuleBlock?.jsonBody ?? ''),
  );
  if ((apiNextModuleBlock?.succeeded ?? true)) {
    if (FFAppState().nextslug == 'show_agreement') {
      logFirebaseEvent('mainAction_navigate_to');

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
      if (FFAppState().nextslug == 'photos') {
        logFirebaseEvent('mainAction_navigate_to');

        context.pushNamed(
          'Photos',
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
        if (FFAppState().nextslug == 'wire_card') {
          logFirebaseEvent('mainAction_backend_call');
          order = await HappyTestAPIGroup.orderCall.call(
            token: FFAppState().Token,
            slug: FFAppState().slug,
          );
          if ((order?.succeeded ?? true)) {
            logFirebaseEvent('mainAction_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  HappyTestAPIGroup.orderCall
                      .bank(
                        (order?.jsonBody ?? ''),
                      )
                      .toString(),
                  style: TextStyle(),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          } else {
            logFirebaseEvent('mainAction_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'апи НЕ сработало',
                  style: TextStyle(),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }

          if (HappyTestAPIGroup.orderCall
                  .bank(
                    (order?.jsonBody ?? ''),
                  )
                  .toString() ==
              'bank-akbars') {
            logFirebaseEvent('mainAction_navigate_to');

            context.pushNamed(
              'bindingAkbars',
              queryParameters: {
                'nextslug': serializeParam(
                  FFAppState().nextslug,
                  ParamType.String,
                ),
                'nextsort': serializeParam(
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
            logFirebaseEvent('mainAction_navigate_to');

            context.pushNamed(
              'BindingOtkrytie',
              queryParameters: {
                'nextslug': serializeParam(
                  FFAppState().nextslug,
                  ParamType.String,
                ),
                'nextsort': serializeParam(
                  FFAppState().nextsort,
                  ParamType.int,
                ),
                'slug': serializeParam(
                  FFAppState().slug,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          }
        } else {
          if (FFAppState().nextslug == 'verification') {
            logFirebaseEvent('mainAction_backend_call');
            apiResultStatus = await HappyTestAPIGroup.statusCall.call(
              token: FFAppState().Token,
              slug: FFAppState().slug,
              status: 'waiting_verification',
            );
            if ((apiResultStatus?.succeeded ?? true)) {
              logFirebaseEvent('mainAction_navigate_to');

              context.pushNamed(
                'Verification',
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
            }
          } else {
            if (FFAppState().nextslug == 'send_sms') {
              logFirebaseEvent('mainAction_navigate_to');

              context.pushNamed(
                'SigningSms',
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
              if (FFAppState().nextslug == 'check_report') {
                logFirebaseEvent('mainAction_navigate_to');

                context.pushNamed(
                  'proverka-ankety',
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
                if (FFAppState().nextslug == 'cross_product') {
                  logFirebaseEvent('mainAction_navigate_to');

                  context.pushNamed(
                    'DopMain',
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
                  if (FFAppState().nextslug == 'finish') {
                    logFirebaseEvent('mainAction_backend_call');
                    apiResult6ag = await HappyTestAPIGroup.statusCall.call(
                      token: FFAppState().Token,
                      slug: FFAppState().slug,
                      status: 'karta-vydana',
                    );
                    logFirebaseEvent('mainAction_navigate_to');

                    context.pushNamed('OrdersList');
                  }
                }
              }
            }
          }
        }
      }
    }
  } else {
    logFirebaseEvent('mainAction_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Сценарий закончился',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 2000),
        backgroundColor: Color(0xFFB8CFF5),
      ),
    );
    logFirebaseEvent('mainAction_wait__delay');
    await Future.delayed(const Duration(milliseconds: 1000));
    logFirebaseEvent('mainAction_navigate_to');

    context.pushNamed(
      'DopMain',
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
  }
}
