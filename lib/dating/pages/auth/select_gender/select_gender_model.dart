import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/selected_container_widget/selected_container_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_gender_widget.dart' show SelectGenderWidget;
import 'package:flutter/material.dart';

class SelectGenderModel extends FlutterFlowModel<SelectGenderWidget> {
  ///  Local state fields for this page.

  String chosenGender = 'Male';

  ///  State fields for stateful widgets in this page.

  // Model for selected_container_widget component.
  late SelectedContainerWidgetModel selectedContainerWidgetModel1;
  // Model for selected_container_widget component.
  late SelectedContainerWidgetModel selectedContainerWidgetModel2;
  // Model for selected_container_widget component.
  late SelectedContainerWidgetModel selectedContainerWidgetModel3;
  // Model for main_button_fill_widget component.
  late MainButtonFillWidgetModel mainButtonFillWidgetModel;

  @override
  void initState(BuildContext context) {
    selectedContainerWidgetModel1 =
        createModel(context, () => SelectedContainerWidgetModel());
    selectedContainerWidgetModel2 =
        createModel(context, () => SelectedContainerWidgetModel());
    selectedContainerWidgetModel3 =
        createModel(context, () => SelectedContainerWidgetModel());
    mainButtonFillWidgetModel =
        createModel(context, () => MainButtonFillWidgetModel());
  }

  @override
  void dispose() {
    selectedContainerWidgetModel1.dispose();
    selectedContainerWidgetModel2.dispose();
    selectedContainerWidgetModel3.dispose();
    mainButtonFillWidgetModel.dispose();
  }
}
