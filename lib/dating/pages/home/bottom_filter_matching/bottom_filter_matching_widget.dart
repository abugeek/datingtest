import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/main_button_outline_widget/main_button_outline_widget_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'bottom_filter_matching_model.dart';
export 'bottom_filter_matching_model.dart';

class BottomFilterMatchingWidget extends StatefulWidget {
  const BottomFilterMatchingWidget({super.key});

  @override
  State<BottomFilterMatchingWidget> createState() =>
      _BottomFilterMatchingWidgetState();
}

class _BottomFilterMatchingWidgetState
    extends State<BottomFilterMatchingWidget> {
  late BottomFilterMatchingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomFilterMatchingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'hrx2d41l' /* Filter */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Space Grotesk',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'pnc7ro06' /* Distance */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Space Grotesk',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: Slider(
                activeColor: FlutterFlowTheme.of(context).primary,
                inactiveColor: FlutterFlowTheme.of(context).alternate,
                min: 0.0,
                max: 100.0,
                value: _model.sliderValue1 ??= 5.0,
                label: _model.sliderValue1?.toStringAsFixed(2),
                onChanged: (newValue) {
                  newValue = double.parse(newValue.toStringAsFixed(2));
                  safeSetState(() => _model.sliderValue1 = newValue);
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'saukvpqo' /* Age */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Space Grotesk',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: Slider(
                activeColor: FlutterFlowTheme.of(context).primary,
                inactiveColor: FlutterFlowTheme.of(context).alternate,
                min: 18.0,
                max: 100.0,
                value: _model.sliderValue2 ??= 18.0,
                label: _model.sliderValue2?.toStringAsFixed(0),
                onChanged: (newValue) {
                  newValue = double.parse(newValue.toStringAsFixed(0));
                  safeSetState(() => _model.sliderValue2 = newValue);
                },
              ),
            ),
            FlutterFlowChoiceChips(
              options: [
                ChipData(FFLocalizations.of(context).getText(
                  'ljzpa1j7' /* Male */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'nu8o2oiy' /* Female */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'c0r297fm' /* Non-binary */,
                ))
              ],
              onChanged: (val) => safeSetState(
                  () => _model.choiceChipsValue = val?.firstOrNull),
              selectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Space Grotesk',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).info,
                iconSize: 16.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Space Grotesk',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                iconSize: 16.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              chipSpacing: 8.0,
              rowSpacing: 8.0,
              multiselect: false,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                [],
              ),
              wrapped: true,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.mainButtonOutlineWidgetModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MainButtonOutlineWidgetWidget(
                      title: FFLocalizations.of(context).getText(
                        'xuwe103l' /* Clear All */,
                      ),
                      isDisable: false,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.mainButtonFillWidgetModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MainButtonFillWidgetWidget(
                      title: FFLocalizations.of(context).getText(
                        '52nrut45' /* Apply */,
                      ),
                      isDisable: false,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ]
              .divide(SizedBox(height: 16.0))
              .addToStart(SizedBox(height: 12.0))
              .addToEnd(SizedBox(height: 32.0)),
        ),
      ),
    );
  }
}
