import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'interests_container_widget_model.dart';
export 'interests_container_widget_model.dart';

class InterestsContainerWidgetWidget extends StatefulWidget {
  const InterestsContainerWidgetWidget({
    super.key,
    required this.id,
    required this.chosenIds,
    required this.title,
    required this.image,
    required this.onTap,
  });

  final int? id;
  final List<int>? chosenIds;
  final String? title;
  final String? image;
  final Future Function()? onTap;

  @override
  State<InterestsContainerWidgetWidget> createState() =>
      _InterestsContainerWidgetWidgetState();
}

class _InterestsContainerWidgetWidgetState
    extends State<InterestsContainerWidgetWidget> {
  late InterestsContainerWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestsContainerWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: widget.chosenIds!.contains(widget.id)
                ? FlutterFlowTheme.of(context).primary500
                : FlutterFlowTheme.of(context).accent4,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 500),
                fadeOutDuration: Duration(milliseconds: 500),
                imageUrl: functions.stringToImage(widget.image!)!,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                errorWidget: (context, error, stackTrace) => Image.asset(
                  'assets/images/error_image.png',
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.title,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Space Grotesk',
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    );
  }
}
