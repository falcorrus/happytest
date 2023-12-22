import '/backend/api_requests/api_calls.dart';
import '/components/add_photo/add_photo_widget.dart';
import '/components/photo_delete/photo_delete_widget.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'photos_model.dart';
export 'photos_model.dart';

class PhotosWidget extends StatefulWidget {
  const PhotosWidget({
    super.key,
    this.slug,
    required this.nextslug,
    required this.nextsort,
  });

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _PhotosWidgetState createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget>
    with TickerProviderStateMixin {
  late PhotosModel _model;

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
    _model = createModel(context, () => PhotosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Photos'});

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
      future: HappyTestAPIGroup.orderCall.call(
        token: FFAppState().Token,
        slug: FFAppState().slug,
      ),
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
        final photosOrderResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FFAppConstants.background,
            body: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PHOTOS_PAGE_Container_190wfanz_ON_TAP');
                              logFirebaseEvent('row_back_action_block');
                              await action_blocks.actionBack(context);
                            },
                            child: wrapWithModel(
                              model: _model.rowBackModel,
                              updateCallback: () => setState(() {}),
                              child: const RowBackWidget(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Фото документов',
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
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 40.0, 0.0, 0.0),
                            child: Text(
                              'Список фото',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                        if (getJsonField(
                              photosOrderResponse.jsonBody,
                              r'''$.data.media''',
                            ) !=
                            null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final media = getJsonField(
                                    photosOrderResponse.jsonBody,
                                    r'''$.data.media''',
                                  ).toList();
                                  if (media.isEmpty) {
                                    return AddPhotoWidget(
                                      slug: widget.slug,
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: media.length,
                                    itemBuilder: (context, mediaIndex) {
                                      final mediaItem = media[mediaIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 14.0, 0.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.easeInOut,
                                          width: 348.0,
                                          height: 68.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color(0xFFEFEFF4),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeIn,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(8.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'PHOTOS_PAGE_Image_pjet1w49_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Image_expand_image');
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      getJsonField(
                                                                        mediaItem,
                                                                        r'''$.url''',
                                                                      ).toString(),
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/happy-akbars-22jzxk/assets/asr8e8i3vilo/vk.jpeg',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      mediaItem,
                                                                      r'''$.url''',
                                                                    ).toString(),
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/happy-akbars-22jzxk/assets/asr8e8i3vilo/vk.jpeg' '$mediaIndex',
                                                                  ),
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                mediaItem,
                                                                r'''$.url''',
                                                              ).toString(),
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/happy-akbars-22jzxk/assets/asr8e8i3vilo/vk.jpeg' '$mediaIndex',
                                                            ),
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  getJsonField(
                                                                    mediaItem,
                                                                    r'''$.url''',
                                                                  ).toString(),
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/happy-akbars-22jzxk/assets/asr8e8i3vilo/vk.jpeg',
                                                                ),
                                                                width: 78.0,
                                                                height: 52.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            mediaItem,
                                                            r'''$.task''',
                                                          ).toString(),
                                                          'empty',
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PHOTOS_PAGE_close_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            const Color(0x00000000),
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: SizedBox(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.6,
                                                                child:
                                                                    PhotoDeleteWidget(
                                                                  slug:
                                                                      FFAppState()
                                                                          .slug,
                                                                  taskNo:
                                                                      getJsonField(
                                                                    mediaItem,
                                                                    r'''$.task_no''',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'listViewOnPageLoadAnimation']!);
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 25.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'PHOTOS_PAGE_Button-acceptTemp_ON_TAP');
                        logFirebaseEvent('Button-acceptTemp_action_block');
                        await action_blocks.mainAction(context);
                      },
                      text: 'ДАЛЕЕ',
                      options: FFButtonOptions(
                        width: 327.0,
                        height: 48.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
