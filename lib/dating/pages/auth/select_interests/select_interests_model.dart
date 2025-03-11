import '/dating/components/interests_container_widget/interests_container_widget_widget.dart';
import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_interests_widget.dart' show SelectInterestsWidget;
import 'package:flutter/material.dart';

class SelectInterestsModel extends FlutterFlowModel<SelectInterestsWidget> {
  ///  Local state fields for this page.

  List<int> chosenIds = [];
  void addToChosenIds(int item) => chosenIds.add(item);
  void removeFromChosenIds(int item) => chosenIds.remove(item);
  void removeAtIndexFromChosenIds(int index) => chosenIds.removeAt(index);
  void insertAtIndexInChosenIds(int index, int item) =>
      chosenIds.insert(index, item);
  void updateChosenIdsAtIndex(int index, Function(int) updateFn) =>
      chosenIds[index] = updateFn(chosenIds[index]);

  ///  State fields for stateful widgets in this page.

  // Models for interests_container_widget dynamic component.
  late FlutterFlowDynamicModels<InterestsContainerWidgetModel>
      interestsContainerWidgetModels;
  // Model for main_button_fill_widget component.
  late MainButtonFillWidgetModel mainButtonFillWidgetModel;

  @override
  void initState(BuildContext context) {
    interestsContainerWidgetModels =
        FlutterFlowDynamicModels(() => InterestsContainerWidgetModel());
    mainButtonFillWidgetModel =
        createModel(context, () => MainButtonFillWidgetModel());
  }

  @override
  void dispose() {
    interestsContainerWidgetModels.dispose();
    mainButtonFillWidgetModel.dispose();
  }
}
