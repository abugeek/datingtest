import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_widget.dart' show SubscriptionWidget;
import 'package:flutter/material.dart';

class SubscriptionModel extends FlutterFlowModel<SubscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // Model for main_button_fill_widget component.
  late MainButtonFillWidgetModel mainButtonFillWidgetModel;

  @override
  void initState(BuildContext context) {
    mainButtonFillWidgetModel =
        createModel(context, () => MainButtonFillWidgetModel());
  }

  @override
  void dispose() {
    mainButtonFillWidgetModel.dispose();
  }
}
