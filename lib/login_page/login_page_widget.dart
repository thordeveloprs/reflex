import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEDEDED),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reflex',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                            child: Text(
                              'Reflex app guide your PG preparationn by focusing your attention on the most relevant previous year questions (PYQs). PYQs are crucial to understand the types of MCQs expected as well important topics to cover.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.7,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                    child: InkWell(
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        final user = await signInWithGoogle(context);
                        if (user == null) {
                          return;
                        }
                        FFAppState().update(() {
                          FFAppState().jwtToken = currentJwtToken!;
                          FFAppState().userName = currentUserDisplayName;
                          FFAppState().emailId = currentUserEmail;
                          FFAppState().displayImage = currentUserPhoto;
                        });
                        await actions.seeTocken(
                          currentJwtToken!,
                        );

                        context.goNamedAuth('PracticePage', mounted);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: SvgPicture.asset(
                              'assets/images/google-icon.svg',
                              width: 20,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            'Login Via Google',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 18, 20, 25),
                child: Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      'By ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'tapping Logigin via google',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      ', you ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'acknowledge',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      '.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      'that ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'you ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'have ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'read the ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'have ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.amazon.com/gp/aw/help/ref=ap_mobile_signin_notification_condition_of_use?id=508088');
                      },
                      child: Text(
                        'Privacy ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF457392),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.amazon.com/gp/aw/help/ref=ap_mobile_signin_notification_condition_of_use?id=508088');
                      },
                      child: Text(
                        'Policy ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF457392),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    Text(
                      'and agree ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      'to the ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.amazon.com/gp/aw/help/ref=ap_mobile_signin_notification_condition_of_use?id=508088');
                      },
                      child: Text(
                        'Term ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF457392),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.amazon.com/gp/aw/help/ref=ap_mobile_signin_notification_privacy_notice?id=468496');
                      },
                      child: Text(
                        'of  ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF457392),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.amazon.com/gp/aw/help/ref=ap_mobile_signin_notification_privacy_notice?id=468496');
                      },
                      child: Text(
                        'Services',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF457392),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
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
    );
  }
}
