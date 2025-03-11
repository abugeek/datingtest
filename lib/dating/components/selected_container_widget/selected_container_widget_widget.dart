import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'selected_container_widget_model.dart';
export 'selected_container_widget_model.dart';

class SelectedContainerWidgetWidget extends StatefulWidget {
  const SelectedContainerWidgetWidget({
    super.key,
    required this.title,
    required this.chosenTitle,
    required this.icon,
    required this.onTap,
  });

  final String? title;
  final String? chosenTitle;
  final Widget? icon;
  final Future Function()? onTap;

  @override
  State<SelectedContainerWidgetWidget> createState() =>
      _SelectedContainerWidgetWidgetState();
}

class _SelectedContainerWidgetWidgetState
    extends State<SelectedContainerWidgetWidget> {
  late SelectedContainerWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedContainerWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.0,
      height: 125.0,
      decoration: BoxDecoration(
        color: widget.title == widget.chosenTitle
            ? FlutterFlowTheme.of(context).secondaryBackground
            : FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: widget.title == widget.chosenTitle
              ? FlutterFlowTheme.of(context).primary500
              : FlutterFlowTheme.of(context).accent4,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon!,
          Text(
            valueOrDefault<String>(
              widget.title,
              'Male',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Space Grotesk',
                  letterSpacing: 0.0,
                ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
