import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/main_button_outline_widget/main_button_outline_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bottom_filter_matching_widget.dart' show BottomFilterMatchingWidget;
import 'package:flutter/material.dart';

class BottomFilterMatchingModel
    extends FlutterFlowModel<BottomFilterMatchingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for main_button_outline_widget component.
  late MainButtonOutlineWidgetModel mainButtonOutlineWidgetModel;
  // Model for main_button_fill_widget component.
  late MainButtonFillWidgetModel mainButtonFillWidgetModel;

  @override
  void initState(BuildContext context) {
    mainButtonOutlineWidgetModel =
        createModel(context, () => MainButtonOutlineWidgetModel());
    mainButtonFillWidgetModel =
        createModel(context, () => MainButtonFillWidgetModel());
  }

  @override
  void dispose() {
    mainButtonOutlineWidgetModel.dispose();
    mainButtonFillWidgetModel.dispose();
  }
}
