import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'main_button_fill_widget_model.dart';
export 'main_button_fill_widget_model.dart';

class MainButtonFillWidgetWidget extends StatefulWidget {
  const MainButtonFillWidgetWidget({
    super.key,
    String? title,
    this.onTap,
    bool? isDisable,
  })  : this.title = title ?? ' ',
        this.isDisable = isDisable ?? false;

  final String title;
  final Future Function()? onTap;
  final bool isDisable;

  @override
  State<MainButtonFillWidgetWidget> createState() =>
      _MainButtonFillWidgetWidgetState();
}

class _MainButtonFillWidgetWidgetState
    extends State<MainButtonFillWidgetWidget> {
  late MainButtonFillWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainButtonFillWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: widget.isDisable
          ? null
          : () async {
              await widget.onTap?.call();
            },
      text: widget.title,
      options: FFButtonOptions(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 56.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Space Grotesk',
              color: Colors.white,
              fontSize: 16.0,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(10.0),
        disabledColor: FlutterFlowTheme.of(context).primary300,
      ),
    );
  }
}
