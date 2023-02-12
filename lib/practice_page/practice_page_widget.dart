import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/nav_bar_widget.dart';
import '../components/need_help_pop_up_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'practice_page_model.dart';
export 'practice_page_model.dart';

class PracticePageWidget extends StatefulWidget {
  const PracticePageWidget({Key? key}) : super(key: key);

  @override
  _PracticePageWidgetState createState() => _PracticePageWidgetState();
}

class _PracticePageWidgetState extends State<PracticePageWidget> {
  late PracticePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: PracticeGroup.getPracticeTestsToShowSubjectsInThePracticeTabCall
          .call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final practicePageGetPracticeTestsToShowSubjectsInThePracticeTabResponse =
            snapshot.data!;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Drawer(
                elevation: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFD3E5F1),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentUserDisplayName
                                              .maybeHandleOverflow(
                                            maxChars: 15,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          currentUserEmail.maybeHandleOverflow(
                                            maxChars: 30,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
                              child: Text(
                                'Contact us',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF424242),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidQuestionCircle,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                child: NeedHelpPopUpWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Text(
                                        'Need Help',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF292929),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidQuestionCircle,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await launchURL(
                                            'https://play.google.com/store/apps/details?id=com.gooded.pgpyqs');
                                      },
                                      child: Text(
                                        'Rate us in Playstore',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF292929),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 15, 15, 15),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.share_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Share.share(
                                            'Join Reflex app to prepare efficiently for NEET PG and INICET!! 📑👨‍⚕️👩‍⚕️ https://play.google.com/store/apps/details?id=com.gooded.pgpyqs',
                                            sharePositionOrigin:
                                                getWidgetBoundingBox(context),
                                          );
                                        },
                                        child: Text(
                                          'Share App',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF292929),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await signOut();

                                      context.goNamedAuth(
                                          'PracticePage', mounted);
                                    },
                                    child: Icon(
                                      Icons.login,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await signOut();

                                        context.goNamedAuth(
                                            'PracticePage', mounted);
                                      },
                                      child: Text(
                                        'Log out',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF292929),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFFD3E5F1),
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 0),
                    child: InkWell(
                      onTap: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: FaIcon(
                        FontAwesomeIcons.alignJustify,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Reflex',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDEDED),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: Builder(
                            builder: (context) {
                              final practiceTest = PracticeGroup
                                      .getPracticeTestsToShowSubjectsInThePracticeTabCall
                                      .practiceTests(
                                        practicePageGetPracticeTestsToShowSubjectsInThePracticeTabResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: practiceTest.length,
                                itemBuilder: (context, practiceTestIndex) {
                                  final practiceTestItem =
                                      practiceTest[practiceTestIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Container(
                                        width: 100,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 15, 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  practiceTestItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                'No. of Quetions: ${getJsonField(
                                                  practiceTestItem,
                                                  r'''$.numQuestions''',
                                                ).toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      _model.tabs =
                                                          await actions.getTabs(
                                                        getJsonField(
                                                          practiceTestItem,
                                                          r'''$.numQuestions''',
                                                        ),
                                                      );
                                                      setState(() {
                                                        FFAppState()
                                                                .numberOfTabs =
                                                            _model.tabs!
                                                                .toList();
                                                      });

                                                      context.pushNamed(
                                                        'PracticeTestPage',
                                                        queryParams: {
                                                          'teatId':
                                                              serializeParam(
                                                            getJsonField(
                                                              practiceTestItem,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Practice',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF3474A1),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
