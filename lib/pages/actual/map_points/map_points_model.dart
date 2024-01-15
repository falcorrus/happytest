import '/components/row_back_back/row_back_back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_points_widget.dart' show MapPointsWidget;
import 'package:flutter/material.dart';

class MapPointsModel extends FlutterFlowModel<MapPointsWidget> {
  ///  Local state fields for this page.

  int? prodslug;

  String? nextSl;

  int? nextSo;

  bool? isPersonalPS;

  String? stringURL;

  LatLng? userWhere;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - returnString] action in MapPoints widget.
  String? url;
  // Stores action output result for [Custom Action - imagePath] action in MapPoints widget.
  String? imageFromURL;
  // Model for row_BackBack component.
  late RowBackBackModel rowBackBackModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    rowBackBackModel = createModel(context, () => RowBackBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rowBackBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
