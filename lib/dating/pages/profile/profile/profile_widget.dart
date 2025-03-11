import '/auth/firebase_auth/auth_util.dart';
import '/dating/components/main_button_fill_widget/main_button_fill_widget_widget.dart';
import '/dating/components/profile_image_widget/profile_image_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
          title: Text(
            FFLocalizations.of(context).getText(
              'g08tki5w' /* My Profile */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (Theme.of(context).brightness == Brightness.dark)
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.solidSun,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        setDarkModeSetting(context, ThemeMode.light);
                      },
                    ),
                  if (Theme.of(context).brightness == Brightness.light)
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.solidMoon,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        setDarkModeSetting(context, ThemeMode.dark);
                      },
                    ),
                ],
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.profileImageWidgetModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ProfileImageWidgetWidget(
                      height: 200.0,
                      width: 200.0,
                      isEdit: false,
                      imageLink: valueOrDefault<String>(
                        (currentUserDocument?.pictures.toList() ?? [])
                            .lastOrNull
                            ?.imageLink,
                        'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_960_720.png',
                      ),
                      blurHash: valueOrDefault<String>(
                        (currentUserDocument?.pictures.toList() ?? [])
                            .lastOrNull
                            ?.hash,
                        'L6Pj0^jE.AyE_3t7t7R**0o#DgR4',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          valueOrDefault<String>(
                            currentUserDisplayName,
                            'Name',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          currentUserEmail,
                          'test@mail.com',
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Space Grotesk',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(EditProfileWidget.routeName);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.userCircle,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ymu7av9g' /* Personal Detail */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Space Grotesk',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Icon(
                              Icons.play_arrow_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!valueOrDefault<bool>(
                        currentUserDocument?.isPremium, false))
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(SubscriptionWidget.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.workspace_premium_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '434adhr3' /* Premium */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Space Grotesk',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                FlutterFlowLanguageSelector(
                  width: 200.0,
                  height: 40.0,
                  borderColor: Colors.transparent,
                  dropdownIconColor: FlutterFlowTheme.of(context).secondaryText,
                  borderRadius: 8.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Space Grotesk',
                        letterSpacing: 0.0,
                      ),
                  hideFlags: false,
                  flagSize: 24.0,
                  flagTextGap: 8.0,
                  currentLanguage: FFLocalizations.of(context).languageCode,
                  languages: FFLocalizations.languages(),
                  onChanged: (lang) => setAppLanguage(context, lang),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: wrapWithModel(
                    model: _model.mainButtonFillWidgetModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MainButtonFillWidgetWidget(
                      title: 'Logout',
                      isDisable: false,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth(
                            OnboardingWidget.routeName, context.mounted);
                      },
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 16.0))
                  .addToStart(SizedBox(height: 12.0))
                  .addToEnd(SizedBox(height: 70.0)),
            ),
          ),
        ),
      ),
    );
  }
}
