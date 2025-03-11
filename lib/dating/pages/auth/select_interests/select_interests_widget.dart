import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/dating/components/interests_container_widget/interests_container_widget_widget.dart';
import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'select_interests_model.dart';
export 'select_interests_model.dart';

class SelectInterestsWidget extends StatefulWidget {
  const SelectInterestsWidget({super.key});

  static String routeName = 'select_interests';
  static String routePath = '/selectInterests';

  @override
  State<SelectInterestsWidget> createState() => _SelectInterestsWidgetState();
}

class _SelectInterestsWidgetState extends State<SelectInterestsWidget> {
  late SelectInterestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectInterestsModel());
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
                          'nnje1eph' /* Select your Interest */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'c5gl68qb' /* Please a few of your interest ... */,
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
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: FutureBuilder<List<InterestsRow>>(
                    future: InterestsTable().queryRows(
                      queryFn: (q) => q,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<InterestsRow> wrapInterestsRowList = snapshot.data!;

                      return Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(wrapInterestsRowList.length,
                            (wrapIndex) {
                          final wrapInterestsRow =
                              wrapInterestsRowList[wrapIndex];
                          return wrapWithModel(
                            model:
                                _model.interestsContainerWidgetModels.getModel(
                              wrapInterestsRow.id.toString(),
                              wrapIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: InterestsContainerWidgetWidget(
                              key: Key(
                                'Keyvrf_${wrapInterestsRow.id.toString()}',
                              ),
                              id: wrapInterestsRow.id,
                              title: wrapInterestsRow.name!,
                              image: wrapInterestsRow.icon!,
                              chosenIds: _model.chosenIds,
                              onTap: () async {
                                if (_model.chosenIds
                                    .contains(wrapInterestsRow.id)) {
                                  _model
                                      .removeFromChosenIds(wrapInterestsRow.id);
                                  safeSetState(() {});
                                } else {
                                  _model.addToChosenIds(wrapInterestsRow.id);
                                  safeSetState(() {});
                                }
                              },
                            ),
                          );
                        }),
                      );
                    },
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
                          'tgcyao1a' /* Continue */,
                        ),
                        isDisable: false,
                        onTap: () async {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'interests_id': _model.chosenIds,
                              },
                            ),
                          });

                          context.pushNamed(HomeWidget.routeName);
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
