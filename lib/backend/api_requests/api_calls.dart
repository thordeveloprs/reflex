import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Practice Group Code

class PracticeGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static GetPracticeTestsToShowSubjectsInThePracticeTabCall
      getPracticeTestsToShowSubjectsInThePracticeTabCall =
      GetPracticeTestsToShowSubjectsInThePracticeTabCall();
  static GetPracticeTestDetailsForAnExampleSubjectAnatomyCall
      getPracticeTestDetailsForAnExampleSubjectAnatomyCall =
      GetPracticeTestDetailsForAnExampleSubjectAnatomyCall();
  static ResetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall
      resetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall =
      ResetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall();
  static GetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
      getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall =
      GetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall();
  static GetStatusOfAllPracticeQuestionsForATestForAGivenUserCall
      getStatusOfAllPracticeQuestionsForATestForAGivenUserCall =
      GetStatusOfAllPracticeQuestionsForATestForAGivenUserCall();
  static CreateAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall
      createAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall =
      CreateAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall();
  static CreateQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall
      createQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall =
      CreateQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall();
  static CreateOrDeleteBookmarkForAPracticeQuestionByAUserCall
      createOrDeleteBookmarkForAPracticeQuestionByAUserCall =
      CreateOrDeleteBookmarkForAPracticeQuestionByAUserCall();
  static GetQuestionIssueListForIssueReportingCall
      getQuestionIssueListForIssueReportingCall =
      GetQuestionIssueListForIssueReportingCall();
}

class GetPracticeTestsToShowSubjectsInThePracticeTabCall {
  Future<ApiCallResponse> call({
    String? courseId = 'Q291cnNlOjIxMzU=',
  }) {
    final body = '''
{
  "query": "query GetPracticeModeTestList(\$id: ID!) {\\n  course(id: \$id) {\\n    tests(orderBy: [SEQID, ID], where: {allowPracticeMode: true}) {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          numQuestions\\n          durationInMin\\n        }\\n      }\\n    }\\n  }\\n}\\n",
  "variables": "{\\"id\\": \\"${courseId}\\"}",
  "operationName": "GetPracticeModeTestList"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Practice Tests to show subjects in the practice tab',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic practiceTests(dynamic response) => getJsonField(
        response,
        r'''$.data.course.tests.edges[:].node''',
        true,
      );
}

class GetPracticeTestDetailsForAnExampleSubjectAnatomyCall {
  Future<ApiCallResponse> call({
    String? testId = '',
  }) {
    final body = '''
{
  "query": "query GetTestDetail(\$id:ID){\\n    test(id:\$id) {\\n    name\\n    numQuestions\\n    sections\\n    sectionNumQues\\n  }\\n}",
  "variables": "{\\"id\\":  \\"${testId}\\"}",
  "operationName": "GetTestDetail"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Practice Test details for an example subject Anatomy ',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic sections(dynamic response) => getJsonField(
        response,
        r'''$.data.test.sections''',
        true,
      );
  dynamic sectionNumQues(dynamic response) => getJsonField(
        response,
        r'''$.data.test.sectionNumQues''',
        true,
      );
  dynamic test(dynamic response) => getJsonField(
        response,
        r'''$.data.test''',
      );
}

class ResetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall {
  Future<ApiCallResponse> call({
    int? selectedId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName:
          'Reset Attempts of a Practice Test shown on clicking on the three dots besides test name ',
      apiUrl: '${PracticeGroup.baseUrl}/api/v1/user/deleteQuestionSetAttempt',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {
        'ignoreTopic': 1,
        'selectedId': selectedId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall {
  Future<ApiCallResponse> call({
    String? testId = 'VGVzdDoyMTIzNjI1',
    int? first = 400,
    int? offset = 0,
  }) {
    final body = '''
{
  "query": "query GetChunkParticularTest(\$id: ID!, \$first: Int!, \$offset: Int!) {\\n  test(id: \$id) {\\n    id\\n    numQuestions\\n    questions(orderBy: [SEQASC],first: \$first, offset:\$offset) {\\n      total\\n      edges {\\n        node {\\n          id\\n          question\\n          options\\n          questionWithMathjax\\n          correctOptionIndex\\n          explanationWithPlyr\\n          bookmarkQuestion {\\n            id\\n          }\\n          userAnswer {\\n            id\\n            userAnswer\\n          }\\n          explanationWithPlyr\\n          topics(first: 1) {\\n            edges {\\n              node {\\n                id\\n                name\\n              }\\n              id\\n              cursor\\n            }\\n          }\\n          analytics {\\n            correctPercentage\\n            correctAnswerCount\\n            incorrectAnswerCount\\n            option1Percentage\\n            option2Percentage\\n            option3Percentage\\n            option4Percentage\\n          }\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\"id\\":  \\"${testId}\\",\\n\\"first\\":${first},\\n  \\"offset\\": ${offset}\\n}",
  "operationName": "GetChunkParticularTest"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get Practice Questions for a test given id offset and first n questions',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic testQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node''',
        true,
      );
}

class GetStatusOfAllPracticeQuestionsForATestForAGivenUserCall {
  Future<ApiCallResponse> call({
    int? testIdInt,
    String? authToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTcyMDU4NCwiZW1haWwiOiJ0aG9yZGV2ZWxvcGVyLnRlY2hAZ21haWwuY29tIiwiZXhwIjoxNjkxOTExOTkyLCJpYXQiOjE2NzYzNTk5OTJ9.7IHkbud_C4J72freq3HpsE2B9q5Z_K9yx9qHq4x20ys',
  }) {
    final body = '''
{
  "query": "query GetQuestionsStatus(\$testId: String) {\\n    allQuestions(testId: \$testId, strict: true, removeHooks: true) {\\n        totalCount\\n        edges {\\n            node {\\n                id\\n                correctOptionIndex\\n                userAnswer {\\n                    userAnswer\\n                }\\n                bookmarkQuestion {\\n                    id\\n                }\\n            }\\n        }\\n    }\\n}\\n",
  "variables": "{\\n  \\"testId\\": \\"${testIdInt}\\"\\n}",
  "operationName": "GetQuestionsStatus"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get Status of all Practice Questions for a test for a given user',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic allQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.allQuestions.edges[:].node''',
        true,
      );
}

class CreateAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall {
  Future<ApiCallResponse> call({
    String? questionId = 'UXVlc3Rpb246NzE3MQ==',
    String? userId = 'VXNlcjo5Nw==',
    int? userAnswer = 3,
    String? authToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6OTcsInBob25lIjoiKzkxNzAyMjAwMTQzNSIsImV4cCI6MTY4OTQwOTQ5OSwiaWF0IjoxNjczODU3NDk5fQ.jNEEFn_BpF7JQoJEDB8lhEdKvujvuOHD12IrdP6_KFk',
  }) {
    final body = '''
{
  "query": "mutation createAnswer(\$input: createAnswerInput!) {\\n    createAnswer(input: \$input) {\\n        clientMutationId\\n    \\t\\tquestion{\\n          userAnswer{\\n            userAnswer\\n          }\\n        }\\n    }\\n}",
  "variables": "{\\n  \\"input\\": {\\n    \\"questionId\\": \\"${questionId}\\",\\n    \\"userId\\": \\"${userId}\\",\\n    \\"userAnswer\\": ${userAnswer}\\n  }\\n}",
  "operationName": "createAnswer"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Create answer for a practice question by a user with specific marked option ',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? userId = '',
    String? typeId = '',
    String? authToken = '',
    String? description = '',
    String? testId = '',
  }) {
    final body = '''
{
  "query": "mutation postCustomerIssue(\$createCustomerIssueInput: createCustomerIssueInput!) {\\n    createCustomerIssue(input: \$createCustomerIssueInput) {\\n        clientMutationId\\n    }\\n}",
  "variables": "{\\n  \\"createCustomerIssueInput\\": {\\n    \\"questionId\\": \\"${questionId}\\",\\n    \\"testId\\": \\"${testId}\\",\\n    \\"typeId\\": \\"${typeId}\\",\\n    \\"description\\": \\"${description}\\",\\n    \\"userId\\": \\"${userId}\\"\\n  }\\n}",
  "operationName": "postCustomerIssue"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Create question issue reported by a user for a question and for an issue type',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrDeleteBookmarkForAPracticeQuestionByAUserCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? userId = '',
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "mutation CreateBookmarkQuestionMutation(\$input: createOrDeleteBookmarkQuestionInput!) {\\n    createOrDeleteBookmarkQuestion(input: \$input) {\\n        clientMutationId\\n    \\t\\tquestion{\\n          bookmarkQuestion{\\n            userId\\n          }\\n        }\\n    }\\n}",
  "variables": "{\\n  \\"input\\": {\\n    \\"questionId\\": \\"${questionId}\\",\\n    \\"userId\\": \\"${userId}\\"\\n  }\\n}",
  "operationName": "CreateBookmarkQuestionMutation"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create or delete bookmark for a practice question by a user',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetQuestionIssueListForIssueReportingCall {
  Future<ApiCallResponse> call() {
    final body = '''
{
  "query": "query GetCustomerIssue(\$focusArea: FocusArea!) {\\n    getCustomerIssueTypes(focusArea: \$focusArea, removeExplanationIssue: true) {\\n        code\\n        id\\n        displayName\\n        description\\n        focusArea\\n    }\\n}",
  "variables": "{\\n  \\"focusArea\\": \\"question\\"\\n}",
  "operationName": "GetCustomerIssue"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get question issue list for Issue reporting',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic questionIssueTypes(dynamic response) => getJsonField(
        response,
        r'''$.data.getCustomerIssueTypes''',
        true,
      );
}

/// End Practice Group Code

/// Start Test Group Code

class TestGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static ListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall
      listOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall =
      ListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall();
  static GetPreviousYearTestsInTestsTabCall getPreviousYearTestsInTestsTabCall =
      GetPreviousYearTestsInTestsTabCall();
  static GetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall
      getSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall =
      GetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall();
}

class ListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall {
  Future<ApiCallResponse> call({
    String? authToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6OTcsInBob25lIjoiKzkxNzAyMjAwMTQzNSIsImV4cCI6MTY4OTQwOTQ5OSwiaWF0IjoxNjczODU3NDk5fQ.jNEEFn_BpF7JQoJEDB8lhEdKvujvuOHD12IrdP6_KFk',
    int? first = 10,
    int? offset = 0,
  }) {
    final body = '''
{
  "query": "query GetCustomPGTests(\$first: Int!, \$offset: Int!) {\\n  me {\\n    customPGTests(orderBy: [IDDESC], first: \$first, offset: \$offset) {\\n    total\\n      edges {\\n        node {\\n          id\\n          name\\n          durationInMin\\n          numQuestions\\n          completedAttempt {\\n            id\\n            completed\\n          }\\n        }\\n      }\\n    }\\n  }\\n}\\n",
  "variables": "{\\n  \\"first\\": ${first},\\n  \\"offset\\": ${offset}\\n}",
  "operationName": "GetCustomPGTests"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'List of custom created tests by the user ordered by date of creation descending ',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic myCustomTests(dynamic response) => getJsonField(
        response,
        r'''$.data.me.customPGTests.edges[:].node''',
        true,
      );
}

class GetPreviousYearTestsInTestsTabCall {
  Future<ApiCallResponse> call({
    String? courseId = 'Q291cnNlOjIxMzU=',
  }) {
    final body = '''
{
  "query": "query GetPracticeModeTestList(\$id: ID!) {\\n  course(id: \$id) {\\n    tests(orderBy: [SEQID, ID], where: {allowPracticeMode: false}) {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          numQuestions\\n          durationInMin\\n        }\\n      }\\n    }\\n  }\\n}\\n",
  "variables": "{\\"id\\": \\"${courseId}\\"}",
  "operationName": "GetPracticeModeTestList"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get previous year tests in tests tab',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic previousTest(dynamic response) => getJsonField(
        response,
        r'''$.data.course.tests.edges[:].node''',
        true,
      );
}

class GetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall {
  Future<ApiCallResponse> call({
    String? courseId = 'Q291cnNlOjIxMzU=',
  }) {
    final body = '''
{
  "query": "query GetCourseSubjectAndTopicList(\$id: ID!) {\\n  course(id: \$id) {\\n    subjects {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          topics(orderBy: SEQID) {\\n            total\\n            edges {\\n              node {\\n                id\\n                name\\n              }\\n            }\\n          }\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"id\\": \\"${courseId}\\"\\n}",
  "operationName": "GetCourseSubjectAndTopicList"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get subjects and chapters for the custom test creation using questions from chosen subjects and chapters',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic subjectWithChapters(dynamic response) => getJsonField(
        response,
        r'''$.data.course.subjects.edges[:].node''',
        true,
      );
  dynamic chapters(dynamic response) => getJsonField(
        response,
        r'''$.data.course.subjects.edges[:].node.topics.edges[:].node''',
        true,
      );
}

/// End Test Group Code

/// Start Notes Group Code

class NotesGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static GetCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall
      getCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall =
      GetCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall();
}

class GetCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetCoursePdfList(\$id: ID!) {\\n  course(id: \$id) {\\n    notes {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          externalURL\\n          free\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"id\\": \\"${courseId}\\"\\n}",
  "operationName": "GetCoursePdfList"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get Course Notes which have external url as links for downloading pdf ',
      apiUrl: '${NotesGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...NotesGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic notes(dynamic response) => getJsonField(
        response,
        r'''$.data.course.notes.edges[:].node''',
        true,
      );
}

/// End Notes Group Code

/// Start Signup Group Code

class SignupGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static LoggedInUserInformationAndCourseAccessCheckingApiCall
      loggedInUserInformationAndCourseAccessCheckingApiCall =
      LoggedInUserInformationAndCourseAccessCheckingApiCall();
  static GoogleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall
      googleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall =
      GoogleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall();
}

class LoggedInUserInformationAndCourseAccessCheckingApiCall {
  Future<ApiCallResponse> call() {
    final body = '''
{
  "query": "query GetMe {\\n  me {\\n    profile {\\n      id\\n      displayName\\n      picture\\n      email\\n    }\\n    userCourses(where: {courseId: 2135}) {\\n      edges {\\n        node {\\n          expiryAt\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "",
  "operationName": "GetMe"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Logged in user information and course access checking api ',
      apiUrl: '${SignupGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjVhNTA5ZjAxOWY3MGQ3NzlkODBmMTUyZDFhNWQzMzgxMWFiN2NlZjciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiQW51amVzaCBEYWhpeWEiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNzdoc09sN1pXb3RhZkJlbzBCQ0ZHbFBhQUlEeDJTamtDSlp4V1NOdz1zOTYtYyIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9uZWV0cHJlcC1wZy1weXFzLTEwMGQxIiwiYXVkIjoibmVldHByZXAtcGctcHlxcy0xMDBkMSIsImF1dGhfdGltZSI6MTY3NTY4NDU5OCwidXNlcl9pZCI6InJjd3UxcEI4cXhiaEV4QlhkaUFadG9hUndFSDMiLCJzdWIiOiJyY3d1MXBCOHF4YmhFeEJYZGlBWnRvYVJ3RUgzIiwiaWF0IjoxNjc1Njg4NDIwLCJleHAiOjE2NzU2OTIwMjAsImVtYWlsIjoiYW51amVzaGRhaGl5YUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMjgwODcwMjE1NTE4NTM4NTQ5MCJdLCJlbWFpbCI6WyJhbnVqZXNoZGFoaXlhQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.QWTw_ARscv8x2Sx8nq4rzVWcmcV7ZagTjMAF2WFTean1di3xZo5aqX09t_Th9pPpR4rmNtB97BZ9HDkosy-dVuxftk3H5uTqIdkEywN4zglONprjoMI79p_8DugjDG59kmMivZX5RC21gSOsMqKn2cMrU5puk8_-2823uctY-dRruIPkIft1RTw0EmdM-2HfxNwjmHO8YF7_YASX1qR3ycRDnLo5BlKz_EtYpWEAShWvNhKLW2fbStrLxjVWZJ8ooST7c6ta6mCh5l_cyuXN8jivMpbkmVbTI9Owobx0nrZsBU52Z3V-kCb_rLIiYEtrEd1UEM5lKCx2qkdqwpz6lQ',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class GoogleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = 'thordeveloper.tech@gmail.com',
    String? name = 'Thor Developers',
    String? picture =
        'https://lh3.googleusercontent.com/a/AEdFTp6WiotPy2D7VWwzHoWTNxvqrZaLVGuQZSfIbG4N=s360-p-no',
  }) {
    return ApiManager.instance.makeApiCall(
      callName:
          'Google login server call with code received from google authentication',
      apiUrl: '${SignupGroup.baseUrl}/authenticate/googleAuth',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
      },
      params: {
        'token': token,
        'email': email,
        'name': name,
        'picture': picture,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

/// End Signup Group Code

/// Start Payment Group Code

class PaymentGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
}

/// End Payment Group Code

class MockServeCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Mock Serve',
      apiUrl:
          'https://aada32bc-36ea-48c1-ac1f-fbcf3d5e6f81.mock.pstmn.io/graphql',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic testQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
