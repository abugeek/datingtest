import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'main_button_outline_widget_model.dart';
export 'main_button_outline_widget_model.dart';

class MainButtonOutlineWidgetWidget extends StatefulWidget {
  const MainButtonOutlineWidgetWidget({
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
  State<MainButtonOutlineWidgetWidget> createState() =>
      _MainButtonOutlineWidgetWidgetState();
}

class _MainButtonOutlineWidgetWidgetState
    extends State<MainButtonOutlineWidgetWidget> {
  late MainButtonOutlineWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainButtonOutlineWidgetModel());
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
        color: Color(0x00CE035F),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Space Grotesk',
              color: FlutterFlowTheme.of(context).primary500,
              fontSize: 16.0,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
        ),
        borderRadius: BorderRadius.circular(10.0),
        disabledColor: FlutterFlowTheme.of(context).primary300,
      ),
    );
  }
}
