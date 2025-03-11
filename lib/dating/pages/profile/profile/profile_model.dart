import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/profile_image_widget/profile_image_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for profile_image_widget component.
  late ProfileImageWidgetModel profileImageWidgetModel;
  // Model for main_button_fill_widget component.
  late MainButtonFillWidgetModel mainButtonFillWidgetModel;

  @override
  void initState(BuildContext context) {
    profileImageWidgetModel =
        createModel(context, () => ProfileImageWidgetModel());
    mainButtonFillWidgetModel =
        createModel(context, () => MainButtonFillWidgetModel());
  }

  @override
  void dispose() {
    profileImageWidgetModel.dispose();
    mainButtonFillWidgetModel.dispose();
  }
}
