import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HappyTest API Group Code

class HappyTestAPIGroup {
  static String baseUrl = 'https://devhappygo.online/api/v1';
  static Map<String, String> headers = {
    'origin': 'https://app.flutterflow.io',
    'Content-Type': 'application/json',
  };
  static AgentsCall agentsCall = AgentsCall();
  static LoginCall loginCall = LoginCall();
  static LoginCodeCall loginCodeCall = LoginCodeCall();
  static UserCall userCall = UserCall();
  static OrdersCall ordersCall = OrdersCall();
  static OrdersVerifCall ordersVerifCall = OrdersVerifCall();
  static OrderCall orderCall = OrderCall();
  static BankDocsCall bankDocsCall = BankDocsCall();
  static DeleteOldCall deleteOldCall = DeleteOldCall();
  static DeleteCall deleteCall = DeleteCall();
  static MediaCall mediaCall = MediaCall();
  static OrdershistoryCall ordershistoryCall = OrdershistoryCall();
  static MeetingCall meetingCall = MeetingCall();
  static StatusesCall statusesCall = StatusesCall();
  static StatusCall statusCall = StatusCall();
  static NextmoduleCall nextmoduleCall = NextmoduleCall();
  static NextmoduleLightCall nextmoduleLightCall = NextmoduleLightCall();
  static ModulesCall modulesCall = ModulesCall();
  static ScenariosCall scenariosCall = ScenariosCall();
  static BindProductCall bindProductCall = BindProductCall();
}

class AgentsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'agents ',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/agents',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "auth_type": "code"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'origin': 'https://happy-test.flutterflow.app',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone''',
      ));
}

class LoginCodeCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "code": "$code",
  "phone": "$phone"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginCode',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/login/code',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'origin': 'https://happy-test.flutterflow.app',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class UserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'user',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OrdersCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? statusCodes =
        'waiting,meeting,meeting_confirmed,nacat-vstrecu,waiting_verification,verified,meeting_rescheduled,napravlen-v-do,samyi-poslednii-status',
    String? today = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Orders',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders/',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'statusCodes':
            "waiting,meeting,meeting_confirmed,nacat-vstrecu,waiting_verification,verified,meeting_rescheduled,napravlen-v-do,samyi-poslednii-status,move_to_delivery",
        'deliveryDateFrom': today,
        'deliveryDateTo': today,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? adres(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? start(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].start''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? finish(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].finish''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? upfatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? orderSlug(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? statusName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? product(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].product.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customer(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].customer.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? proSlug(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].product.slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].client.phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pdf(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].externalAgreement''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isRequired(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].media[:].required''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  String? customerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CustomerId''',
      ));
}

class OrdersVerifCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? statusCodes = 'denied',
    String? today = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OrdersVerif',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders/',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'statusCodes': "denied",
        'deliveryDateFrom': today,
        'deliveryDateTo': today,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? adres(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? start(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].start''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? finish(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].finish''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? upfatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? orderSlug(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? statusName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? product(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].product.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customer(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].customer.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? proSlug(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].product.slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].client.phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pdf(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].externalAgreement''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isRequired(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].media[:].required''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  String? customerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CustomerId''',
      ));
}

class OrderCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'order',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/$slug',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? adress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.address''',
      ));
  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.date''',
      ));
  String? start(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.start''',
      ));
  String? finish(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.finish''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status.name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.client.lastname''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.client.firstname''',
      ));
  String? middleName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.client.middlename''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.client.phone''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.city.name''',
      ));
  String? bank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.customer.name''',
      ));
  String? product(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.product.name''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  List<String>? photoList(dynamic response) => (getJsonField(
        response,
        r'''$.data.media[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? listUrl(dynamic response) => (getJsonField(
        response,
        r'''$.data.media[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? color(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status.color''',
      ));
  String? statusslug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status.slug''',
      ));
  int? prodslug(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.product.slug''',
      ));
  String? comment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.comment''',
      ));
  String? pdf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.externalAgreement''',
      ));
  bool? isPersonal(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.is_personal''',
      ));
  String? customerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.CustomerId''',
      ));
  String? orderSlug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.slug''',
      ));
}

class BankDocsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? customerID = '',
    String? agentSlug = '',
    String? orderId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bankDocs',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders/agent/$agentSlug/media',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'customerId': customerID,
        'agentSlug': agentSlug,
        'orderId': orderId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.data.files[:].path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data.files''',
        true,
      ) as List?;
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data.files[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? agentSlug(dynamic response) => (getJsonField(
        response,
        r'''$.data.files[:].agent.slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? orderSlug(dynamic response) => (getJsonField(
        response,
        r'''$.data.files[:].order_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteOldCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteOld',
      apiUrl:
          '${HappyTestAPIGroup.baseUrl}/order/$slug/media/delete/$taskNo',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class DeleteCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/$slug/media/$taskNo',
      callType: ApiCallType.DELETE,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class MediaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Media',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/$slug/media/$taskNo',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept': 'multipart/form-data',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class OrdershistoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
    bool? isFinished = true,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ordershistory',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders/',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'finished': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class MeetingCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
    String? date = '',
    String? start = '',
    String? finish = '',
  }) async {
    final ffApiRequestBody = '''
{
  "delivery_date": "$date",
  "delivery_time1": "$start",
  "delivery_time2": "$finish"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'meeting',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/$slug',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StatusesCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'statuses',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/statuses',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'all': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StatusCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? status = '',
    String? token = '',
    String? comment = '',
  }) async {
    final ffApiRequestBody = '''
{
  "description": "$comment"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'status',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/$slug/status/$status',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? statusSlug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status.slug''',
      ));
  String? statusName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status.name''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.client.phone''',
      ));
}

class NextmoduleCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? code = '',
    int? sort,
    String? smsCode = '',
    String? phone = '',
    int? productID,
    bool? answerDELETE,
    String? orderId = '',
    String? q1 =
        'Видны признаки маргинального поведения (состояние опьянения, агрессивного поведения и пр.)',
    bool? a1,
    String? q2 =
        'Признаки мошенничества (паспорт имеет признаки подделки, признаки неплатежеспособности, неуверенное поведение и пр.)',
    bool? a2 = false,
    String? q3 =
        'Принуждение клиентом (третьими лицами) курьера к оформлению заявки',
    bool? a3,
    int? crossProductId,
    String? card = '',
  }) async {
    final ffApiRequestBody = '''
{
  "productId": $productID,
  "code": "$code",
  "sort": $sort,
  "data": {
    "phone": "$phone",
    "smsCode": "$smsCode",
    "orderId": "$orderId",
    "crossProductId": $crossProductId,
    "card": {
      "id": "$card"
    },
    "form": [
      {
        "question": "$q1",
        "answer": $a1
      },
      {
        "question": "$q2",
        "answer": $a2
      },
      {
        "question": "$q3",
        "answer": $a3
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'nextmodule',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/products/next_module',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  int? sort(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.next.sort''',
      ));
  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.next.code''',
      ));
}

class NextmoduleLightCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? code = '',
    int? sort,
    String? smsCode = '',
    String? phone = '',
    int? productID,
    String? orderId = '',
    int? crossProductId,
    int? prevSort,
  }) async {
    final ffApiRequestBody = '''
{
  "productId": $productID,
  "code": "$code",
  "sort": $sort,
  "data": {
    "orderId": "$orderId",
    "crossProductId": $crossProductId
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'nextmoduleLight',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/products/next_module',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  int? sort(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.next.sort''',
      ));
  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.next.code''',
      ));
  int? presSort(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.next.prevSort''',
      ));
}

class ModulesCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'modules',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/products/modules',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ScenariosCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'scenarios',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/products/scenarios',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BindProductCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? cardId = '',
    String? bankName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "cardId": "$cardId",
  "bankName": "$bankName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bindProduct',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/agents/product/bind',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End HappyTest API Group Code

class YandexNewCall {
  static Future<ApiCallResponse> call({
    String? geokode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YandexNew',
      apiUrl: 'https://geocode-maps.yandex.ru/1.x/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apikey': "65a3cf3d-3fcc-423d-8846-cf1aa3173c1b",
        'geocode': geokode,
        'format': "json",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static List<String>? latLong(dynamic response) => (getJsonField(
        response,
        r'''$.response.GeoObjectCollection.featureMember[:].GeoObject.boundedBy.Envelope.lowerCorner''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? latlongposition(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.GeoObjectCollection.featureMember[:].GeoObject.Point.pos''',
      ));
}

class GoogleMapCall {
  static Future<ApiCallResponse> call({
    String? address = '',
    String? placeid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google map',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json?$address',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
        'key': "AIzaSyBRzpvAq6MG9GdwONofiDpSSSTpR1fCg3E",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      ));
  static List<String>? addressName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].address_components[:].long_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? placeID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].place_id''',
      ));
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
