import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'red_record_model.dart';
export 'red_record_model.dart';

class RedRecordWidget extends StatefulWidget {
  const RedRecordWidget({super.key});

  @override
  _RedRecordWidgetState createState() => _RedRecordWidgetState();
}

class _RedRecordWidgetState extends State<RedRecordWidget> {
  late RedRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedRecordModel());

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
      alignment: const AlignmentDirectional(1.0, 0.0),
      child: Lottie.asset(
        'assets/lottie_animations/loader.json',
        width: 45.0,
        height: 22.0,
        fit: BoxFit.contain,
        animate: true,
      ),
    );
  }
}
