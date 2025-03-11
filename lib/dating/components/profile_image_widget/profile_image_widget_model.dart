import '/flutter_flow/flutter_flow_util.dart';
import 'profile_image_widget_widget.dart' show ProfileImageWidgetWidget;
import 'package:flutter/material.dart';

class ProfileImageWidgetModel
    extends FlutterFlowModel<ProfileImageWidgetWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
