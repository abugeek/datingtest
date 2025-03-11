import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/profile_image_widget/profile_image_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  DateTime? localDate;

  ///  State fields for stateful widgets in this page.

  // Model for profile_image_widget component.
  late ProfileImageWidgetModel profileImageWidgetModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileTextController;
  final mobileMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? mobileTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
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
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    mobileFocusNode?.dispose();
    mobileTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    mainButtonFillWidgetModel.dispose();
  }
}
