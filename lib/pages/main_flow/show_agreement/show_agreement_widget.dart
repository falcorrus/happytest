import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_agreement_model.dart';
export 'show_agreement_model.dart';

class ShowAgreementWidget extends StatefulWidget {
  const ShowAgreementWidget({
    Key? key,
    this.slug,
    required this.nextslug,
    required this.nextsort,
  }) : super(key: key);

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _ShowAgreementWidgetState createState() => _ShowAgreementWidgetState();
}

class _ShowAgreementWidgetState extends State<ShowAgreementWidget> {
  late ShowAgreementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowAgreementModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ShowAgreement'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SHOW_AGREEMENT_ShowAgreement_ON_INIT_STA');
      logFirebaseEvent('ShowAgreement_backend_call');
      _model.apiResultProduct02 = await HappyTestAPIGroup.nextmoduleCall.call(
        token: FFAppState().Token,
        productID: FFAppState().prodslug,
        code: widget.nextslug,
        sort: widget.nextsort,
      );
      logFirebaseEvent('ShowAgreement_update_page_state');
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.rowBackModel,
                  updateCallback: () => setState(() {}),
                  child: RowBackWidget(),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 13.0, 0.0, 0.0),
                    child: Text(
                      'Договор',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Montserrat',
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 20.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('SHOW_AGREEMENT_Container-title_ON_TAP');
                      logFirebaseEvent(
                          'Container-title_upload_media_to_firebase');
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          setState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl = downloadUrls.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }

                      logFirebaseEvent('Container-title_wait__delay');
                      await Future.delayed(const Duration(milliseconds: 1000));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1FE),
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                          color: Color(0xFFEFEFF4),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, 0.05),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 13.0, 0.0, 13.0),
                          child: Text(
                            'Документ для подписания',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlutterFlowPdfViewer(
                    assetPath: 'assets/pdfs/bs6js__.pdf',
                    horizontalScroll: false,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 25.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SHOW_AGREEMENT_PAGE_Button-more_ON_TAP');
                      logFirebaseEvent('Button-more_action_block');
                      await action_blocks.mainAction(context);
                    },
                    text: 'ДАЛЕЕ',
                    options: FFButtonOptions(
                      width: 327.0,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF4460F0),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 12.0,
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.5,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
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
          ],
        ),
      ),
    );
  }
}
