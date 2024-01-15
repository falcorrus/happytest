import '/backend/api_requests/api_calls.dart';
import '/components/verification_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';

Future mainAction(BuildContext context) async {
  ApiCallResponse? apiNextModuleBlock;
  ApiCallResponse? apiResultStatus;
  ApiCallResponse? apiStatus3;
  ApiCallResponse? apiStatus1;
  ApiCallResponse? apiStatus2;

  // при нажатии внизу "далее"
  // - присваиваем Code и Sort следующей страницы.
  // - по Code-Sort понимаем, в какой следующий блок дерева отправляем
  //
  logFirebaseEvent('mainAction_backend_call');
  apiNextModuleBlock = await HappyTestAPIGroup.nextmoduleCall.call(
    token: FFAppState().Token,
    productID: FFAppState().prodslug,
    code: FFAppState().nextslug,
    sort: FFAppState().nextsort,
    orderId: FFAppState().slug,
  );
  logFirebaseEvent('mainAction_update_app_state');
  FFAppState().nextslug = HappyTestAPIGroup.nextmoduleCall.code(
    (apiNextModuleBlock.jsonBody ?? ''),
  )!;
  FFAppState().nextsort = HappyTestAPIGroup.nextmoduleCall.sort(
    (apiNextModuleBlock.jsonBody ?? ''),
  )!;
  if ((apiNextModuleBlock.succeeded ?? true)) {
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
          if ((FFAppState().bankName == 'bank-akbars') ||
              (FFAppState().bankName == 'bank-rosbank')) {
            logFirebaseEvent('mainAction_navigate_to');

            context.pushNamed(
              'binding',
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
              'BindingAll',
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
            logFirebaseEvent('mainAction_alert_dialog');
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: const VerificationCompWidget(),
                );
              },
            );
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
                    'Finish',
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
                  if (FFAppState().nextslug == 'samyi-poslednii-status') {
                    if (FFAppState().bankName == 'bank-rosbank') {
                      logFirebaseEvent('mainAction_backend_call');
                      unawaited(
                        () async {
                          apiStatus3 = await HappyTestAPIGroup.statusCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                            status: 'zaversit-vstrecu',
                          );
                        }(),
                      );
                      logFirebaseEvent('mainAction_backend_call');
                      unawaited(
                        () async {
                          apiStatus1 = await HappyTestAPIGroup.statusCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                            status: 'validation_by_bank',
                          );
                        }(),
                      );
                      logFirebaseEvent('mainAction_navigate_to');

                      context.goNamed('OrdersList');
                    } else {
                      logFirebaseEvent('mainAction_backend_call');
                      unawaited(
                        () async {
                          apiStatus2 = await HappyTestAPIGroup.statusCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                            status: 'karta-vydana',
                          );
                        }(),
                      );
                      logFirebaseEvent('mainAction_navigate_to');

                      context.goNamed(
                        'Finish',
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
                    logFirebaseEvent('mainAction_navigate_to');

                    context.pushNamed(
                      'Finish',
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
              }
            }
          }
        }
      }
    }
  } else {
    if ((apiNextModuleBlock.statusCode ?? 200) == 403) {
      logFirebaseEvent('mainAction_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ошибка 403. Не хватает прав агента',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: const Color(0xFFB8CFF5),
        ),
      );
      logFirebaseEvent('mainAction_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
    } else {
      if (HappyTestAPIGroup.nextmoduleCall.code(
                (apiNextModuleBlock.jsonBody ?? ''),
              ) ==
              null ||
          HappyTestAPIGroup.nextmoduleCall.code(
                (apiNextModuleBlock.jsonBody ?? ''),
              ) ==
              '') {
        logFirebaseEvent('mainAction_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Сценарий закончился',
              style: TextStyle(),
            ),
            duration: Duration(milliseconds: 2000),
            backgroundColor: Color(0xFFB8CFF5),
          ),
        );
      }
      logFirebaseEvent('mainAction_navigate_to');

      context.pushNamed(
        'Finish',
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
}

Future actionBack(BuildContext context) async {
  ApiCallResponse? apiPrevModule;
  ApiCallResponse? apiResultStatus;
  ApiCallResponse? apiStatus3;
  ApiCallResponse? apiStatus1;
  ApiCallResponse? apiStatus2;

  // Если хотим не на след экран, а не предыдущий, то можно использовать PrevSort, он на 2 меньше чем Sort (бэк)
  logFirebaseEvent('actionBack_backend_call');
  apiPrevModule = await HappyTestAPIGroup.nextmoduleLightCall.call(
    token: FFAppState().Token,
    code: FFAppState().nextslug,
    sort: FFAppState().nextsort > 1 ? (FFAppState().nextsort - 2) : -10,
    productID: FFAppState().prodslug,
    orderId: FFAppState().slug,
  );
  if ((apiPrevModule.succeeded ?? true)) {
    logFirebaseEvent('actionBack_update_app_state');
    FFAppState().nextslug = HappyTestAPIGroup.nextmoduleLightCall.code(
      (apiPrevModule.jsonBody ?? ''),
    )!;
    FFAppState().nextsort = HappyTestAPIGroup.nextmoduleLightCall.sort(
      (apiPrevModule.jsonBody ?? ''),
    )!;
    if (FFAppState().nextslug == 'show_agreement') {
      logFirebaseEvent('actionBack_navigate_to');

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
        logFirebaseEvent('actionBack_navigate_to');

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
          if ((FFAppState().bankName == 'bank-akbars') ||
              (FFAppState().bankName == 'bank-rosbank')) {
            logFirebaseEvent('actionBack_navigate_to');

            context.pushNamed(
              'binding',
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
            logFirebaseEvent('actionBack_navigate_to');

            context.pushNamed(
              'BindingAll',
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
            logFirebaseEvent('actionBack_backend_call');
            apiResultStatus = await HappyTestAPIGroup.statusCall.call(
              token: FFAppState().Token,
              slug: FFAppState().slug,
              status: 'waiting_verification',
            );
            logFirebaseEvent('actionBack_alert_dialog');
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: const VerificationCompWidget(),
                );
              },
            );
          } else {
            if (FFAppState().nextslug == 'send_sms') {
              logFirebaseEvent('actionBack_navigate_to');

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
                logFirebaseEvent('actionBack_navigate_to');

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
                  logFirebaseEvent('actionBack_navigate_to');

                  context.pushNamed(
                    'Finish',
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
                  if (FFAppState().nextslug == 'samyi-poslednii-status') {
                    if (FFAppState().bankName == 'bank-rosbank') {
                      logFirebaseEvent('actionBack_backend_call');
                      unawaited(
                        () async {
                          apiStatus3 = await HappyTestAPIGroup.statusCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                            status: 'zaversit-vstrecu',
                          );
                        }(),
                      );
                      logFirebaseEvent('actionBack_backend_call');
                      unawaited(
                        () async {
                          apiStatus1 = await HappyTestAPIGroup.statusCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                            status: 'validation_by_bank',
                          );
                        }(),
                      );
                      logFirebaseEvent('actionBack_navigate_to');

                      context.goNamed('OrdersList');
                    } else {
                      logFirebaseEvent('actionBack_backend_call');
                      unawaited(
                        () async {
                          apiStatus2 = await HappyTestAPIGroup.statusCall.call(
                            token: FFAppState().Token,
                            slug: FFAppState().slug,
                            status: 'karta-vydana',
                          );
                        }(),
                      );
                      logFirebaseEvent('actionBack_navigate_to');

                      context.goNamed(
                        'Finish',
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
                    logFirebaseEvent('actionBack_navigate_to');

                    context.pushNamed(
                      'Order',
                      queryParameters: {
                        'slug': serializeParam(
                          FFAppState().slug,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  }
                }
              }
            }
          }
        }
      }
    }
  } else {
    logFirebaseEvent('actionBack_navigate_to');

    context.pushNamed(
      'Order',
      queryParameters: {
        'slug': serializeParam(
          FFAppState().slug,
          ParamType.String,
        ),
      }.withoutNulls,
    );
  }
}
