import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  ReflexFirebaseUser? initialUser;
  ReflexFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(ReflexFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? PracticePageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? PracticePageWidget()
              : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'PracticePage',
              path: 'practicePage',
              builder: (context, params) => PracticePageWidget(),
            ),
            FFRoute(
              name: 'PracticeTestPage',
              path: 'practiceTestPage',
              builder: (context, params) => PracticeTestPageWidget(
                teatId: params.getParam('teatId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PracticeQuetionsPage',
              path: 'practiceQuetionsPage',
              builder: (context, params) => PracticeQuetionsPageWidget(
                testId: params.getParam('testId', ParamType.String),
                first: params.getParam('first', ParamType.int),
                offset: params.getParam('offset', ParamType.int),
                numberOfQuestions:
                    params.getParam('numberOfQuestions', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'NotesPage',
              path: 'notesPage',
              builder: (context, params) => NotesPageWidget(),
            ),
            FFRoute(
              name: 'CreateTestResultPage',
              path: 'createTestResultPage',
              builder: (context, params) => CreateTestResultPageWidget(
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'CreateAndPreviewTestPage',
              path: 'createAndPreviewTestPage',
              builder: (context, params) => CreateAndPreviewTestPageWidget(),
            ),
            FFRoute(
              name: 'CreateTestPage',
              path: 'createTestPage',
              builder: (context, params) => CreateTestPageWidget(),
            ),
            FFRoute(
              name: 'TestList',
              path: 'testList',
              builder: (context, params) => TestListWidget(
                pdfLink: params.getParam('pdfLink', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'StartTestPage',
              path: 'startTestPage',
              builder: (context, params) => StartTestPageWidget(
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'OrderPage',
              path: 'orderPage',
              builder: (context, params) => OrderPageWidget(),
            ),
            FFRoute(
              name: 'testingNew',
              path: 'testingNew',
              builder: (context, params) => TestingNewWidget(),
            ),
            FFRoute(
              name: 'LearnMore',
              path: 'learnMore',
              builder: (context, params) => LearnMoreWidget(
                value: params.getParam('value', ParamType.String),
                is6MonthChecked:
                    params.getParam('is6MonthChecked', ParamType.bool),
                is1YearChecked:
                    params.getParam('is1YearChecked', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'ReportQuestionPage',
              path: 'reportQuestionPage',
              builder: (context, params) => ReportQuestionPageWidget(
                testId: params.getParam('testId', ParamType.String),
                questionId: params.getParam('questionId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ReportQuestionSubmitPage',
              path: 'reportQuestionSubmitPage',
              builder: (context, params) => ReportQuestionSubmitPageWidget(
                testId: params.getParam('testId', ParamType.String),
                questionId: params.getParam('questionId', ParamType.String),
                typeId: params.getParam('typeId', ParamType.String),
                issueType: params.getParam('issueType', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'TestPage',
              path: 'testPage',
              builder: (context, params) => TestPageWidget(
                testId: params.getParam('testId', ParamType.String),
                first: params.getParam('first', ParamType.int),
                offset: params.getParam('offset', ParamType.int),
                numberOfQuestions:
                    params.getParam('numberOfQuestions', ParamType.int),
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
                min: params.getParam('min', ParamType.int),
                sec: params.getParam('sec', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'ViewAnswerPage',
              path: 'viewAnswerPage',
              builder: (context, params) => ViewAnswerPageWidget(
                testId: params.getParam('testId', ParamType.String),
                first: params.getParam('first', ParamType.int),
                offset: params.getParam('offset', ParamType.int),
                numberOfQuestions:
                    params.getParam('numberOfQuestions', ParamType.int),
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'PreviousTestResultPage',
              path: 'previousTestResultPage',
              builder: (context, params) => PreviousTestResultPageWidget(
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
                testAttemptId:
                    params.getParam('testAttemptId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PreviousTestStartPage',
              path: 'previousTestStartPage',
              builder: (context, params) => PreviousTestStartPageWidget(
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'previousTestPage',
              path: 'previousTestPage',
              builder: (context, params) => PreviousTestPageWidget(
                testId: params.getParam('testId', ParamType.String),
                first: params.getParam('first', ParamType.int),
                offset: params.getParam('offset', ParamType.int),
                numberOfQuestions:
                    params.getParam('numberOfQuestions', ParamType.int),
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
                min: params.getParam('min', ParamType.int),
                sec: params.getParam('sec', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'previousAnswersPage',
              path: 'previousAnswersPage',
              builder: (context, params) => PreviousAnswersPageWidget(
                testId: params.getParam('testId', ParamType.String),
                first: params.getParam('first', ParamType.int),
                offset: params.getParam('offset', ParamType.int),
                numberOfQuestions:
                    params.getParam('numberOfQuestions', ParamType.int),
                customTestJson:
                    params.getParam('customTestJson', ParamType.JSON),
                min: params.getParam('min', ParamType.int),
                sec: params.getParam('sec', ParamType.int),
                testAttemptId:
                    params.getParam('testAttemptId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'LockPage',
              path: 'lockPage',
              builder: (context, params) => LockPageWidget(),
            ),
            FFRoute(
              name: 'nonMemberShipPracticeTestPage',
              path: 'nonMemberShipPracticeTestPage',
              builder: (context, params) => NonMemberShipPracticeTestPageWidget(
                teatId: params.getParam('teatId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NonMemberShipCreateAndPreviewTestPage',
              path: 'nonMemberShipCreateAndPreviewTestPage',
              builder: (context, params) =>
                  NonMemberShipCreateAndPreviewTestPageWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
