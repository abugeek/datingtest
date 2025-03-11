import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/selected_container_widget/selected_container_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'select_gender_model.dart';
export 'select_gender_model.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({super.key});

  static String routeName = 'select_gender';
  static String routePath = '/selectGender';

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  late SelectGenderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectGenderModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '0crvx1l2' /*   */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '72ytaipm' /* Select Gender */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ggnfzjae' /* Please select your gender */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Space Grotesk',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.selectedContainerWidgetModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: SelectedContainerWidgetWidget(
                          title: FFLocalizations.of(context).getText(
                            'ih27t18n' /* Male */,
                          ),
                          chosenTitle: _model.chosenGender,
                          icon: FaIcon(
                            FontAwesomeIcons.mars,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onTap: () async {
                            _model.chosenGender = 'Male';
                            safeSetState(() {});
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.selectedContainerWidgetModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: SelectedContainerWidgetWidget(
                          title: FFLocalizations.of(context).getText(
                            '0p3pyg35' /* Female */,
                          ),
                          chosenTitle: _model.chosenGender,
                          icon: FaIcon(
                            FontAwesomeIcons.venus,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onTap: () async {
                            _model.chosenGender = 'Female';
                            safeSetState(() {});
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.selectedContainerWidgetModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: SelectedContainerWidgetWidget(
                          title: FFLocalizations.of(context).getText(
                            'i0bpcek5' /* Non-binary */,
                          ),
                          chosenTitle: _model.chosenGender,
                          icon: FaIcon(
                            FontAwesomeIcons.marsStrokeV,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onTap: () async {
                            _model.chosenGender = 'Non-binary';
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                wrapWithModel(
                  model: _model.mainButtonFillWidgetModel,
                  updateCallback: () => safeSetState(() {}),
                  child: Hero(
                    tag: 'main-button',
                    transitionOnUserGestures: true,
                    child: Material(
                      color: Colors.transparent,
                      child: MainButtonFillWidgetWidget(
                        title: FFLocalizations.of(context).getText(
                          '2ifyxtyq' /* Continue */,
                        ),
                        isDisable: false,
                        onTap: () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            gender: _model.chosenGender,
                          ));

                          context.pushNamed(SelectInterestsWidget.routeName);
                        },
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
