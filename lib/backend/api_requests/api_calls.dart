import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HappyTest API Group Code

class HappyTestAPIGroup {
  static String baseUrl = 'https://devhappygo.online/api/v1';
  static Map<String, String> headers = {
    'origin': 'https://app.flutterflow.io',
  };
  static AgentsCall agentsCall = AgentsCall();
  static LoginCall loginCall = LoginCall();
  static UserCall userCall = UserCall();
  static OrdersCall ordersCall = OrdersCall();
  static OrderCall orderCall = OrderCall();
  static OrderPdfCall orderPdfCall = OrderPdfCall();
  static DeleteCall deleteCall = DeleteCall();
  static MediaCall mediaCall = MediaCall();
  static OrdershistoryCall ordershistoryCall = OrdershistoryCall();
  static MeetingCall meetingCall = MeetingCall();
  static StatusesCall statusesCall = StatusesCall();
  static StatusCall statusCall = StatusCall();
  static NextmoduleCall nextmoduleCall = NextmoduleCall();
  static ModulesCall modulesCall = ModulesCall();
  static ScenariosCall scenariosCall = ScenariosCall();
}

class AgentsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'agents ',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/agents',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'origin': 'https://happy-test.flutterflow.app',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
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
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrdersCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? statusCodes =
        'waiting,meeting,meeting_confirmed,nacat-vstrecu,waiting_verification,verified,meeting_rescheduled,napravlen-v-do,samyi-poslednii-status',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Orders',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders/',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'statusCodes':
            "waiting,meeting,meeting_confirmed,nacat-vstrecu,waiting_verification,verified,meeting_rescheduled,napravlen-v-do,samyi-poslednii-status,move_to_delivery",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic adres(dynamic response) => getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start''',
        true,
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data[:].finish''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      );
  dynamic upfatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].updated_at''',
        true,
      );
  dynamic slug(dynamic response) => getJsonField(
        response,
        r'''$.data[:].slug''',
        true,
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.name''',
        true,
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.data[:].product.name''',
        true,
      );
  dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].customer.name''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic proSlug(dynamic response) => getJsonField(
        response,
        r'''$.data[:].product.slug''',
        true,
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data[:].client.phone''',
        true,
      );
  dynamic pdf(dynamic response) => getJsonField(
        response,
        r'''$.data[:].externalAgreement''',
        true,
      );
}

class OrderCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'order',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.data.city.name''',
      );
  dynamic bank(dynamic response) => getJsonField(
        response,
        r'''$.data.customer.name''',
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.data.product.name''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  dynamic photoList(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].link''',
        true,
      );
  dynamic listUrl(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].url''',
        true,
      );
  dynamic color(dynamic response) => getJsonField(
        response,
        r'''$.data.status.color''',
      );
  dynamic statusslug(dynamic response) => getJsonField(
        response,
        r'''$.data.status.slug''',
      );
  dynamic prodslug(dynamic response) => getJsonField(
        response,
        r'''$.data.product.slug''',
      );
  dynamic comment(dynamic response) => getJsonField(
        response,
        r'''$.data.comment''',
      );
  dynamic pdf(dynamic response) => getJsonField(
        response,
        r'''$.data.externalAgreement''',
      );
}

class OrderPdfCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'order pdf',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}',
      callType: ApiCallType.GET,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.data.city.name''',
      );
  dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.data.customer.name''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  dynamic photoList(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].link''',
        true,
      );
  dynamic listUrl(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].url''',
        true,
      );
  dynamic color(dynamic response) => getJsonField(
        response,
        r'''$.data.status.color''',
      );
  dynamic statusslug(dynamic response) => getJsonField(
        response,
        r'''$.data.status.slug''',
      );
  dynamic comment(dynamic response) => getJsonField(
        response,
        r'''$.data.comment''',
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
      apiUrl:
          '${HappyTestAPIGroup.baseUrl}/order/${slug}/media/delete/${taskNo}',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/media/${taskNo}',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
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
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'finished': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
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
  "delivery_date": "${date}",
  "delivery_time1": "${start}",
  "delivery_time2": "${finish}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'meeting',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
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
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'all': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  "description": "${comment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'status',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/status/${status}',
      callType: ApiCallType.POST,
      headers: {
        'origin': 'https://app.flutterflow.io',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic statusSlug(dynamic response) => getJsonField(
        response,
        r'''$.data.status.slug''',
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
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
    int? crossProductId = 0,
  }) async {
    final ffApiRequestBody = '''
{
  "productId": ${productID},
  "code": "${code}",
  "sort": ${sort},
  "data": {
    "phone": "${phone}",
    "smsCode": "${smsCode}",
    "orderId": "${orderId}",
    "crossProductId": ${crossProductId},
    "form": [
      {
        "question": "${q1}",
        "answer": ${a1}
      },
      {
        "question": "${q2}",
        "answer": ${a2}
      },
      {
        "question": "${q3}",
        "answer": ${a3}
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
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic sort(dynamic response) => getJsonField(
        response,
        r'''$.next.sort''',
      );
  dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.next.code''',
      );
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
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End HappyTest API Group Code

class YandexCall {
  static Future<ApiCallResponse> call({
    String? geokode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Yandex',
      apiUrl: 'https://geocode-maps.yandex.ru/1.x/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apikey': "e3e49124-38b3-4ced-8569-ce6e91b6c826",
        'geocode': geokode,
        'format': "json",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic latLong(dynamic response) => getJsonField(
        response,
        r'''$.response.GeoObjectCollection.featureMember[:].GeoObject.boundedBy.Envelope.lowerCorner''',
        true,
      );
}

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
        'apikey': "e3e49124-38b3-4ced-8569-ce6e91b6c826",
        'geocode': geokode,
        'format': "json",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic latLong(dynamic response) => getJsonField(
        response,
        r'''$.response.GeoObjectCollection.featureMember[:].GeoObject.boundedBy.Envelope.lowerCorner''',
        true,
      );
}

class HttpshdjustdsruorderbabcedbeacmediaCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' httpshdjustdsruorderbabcedbeacmedia',
      apiUrl:
          'https://hd.justds.ru/order/8b686a0b-333c-11ed-b4e7-0242ac140012/media/1',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HttpsmailhappyphoneruapivloginCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'httpsmailhappyphoneruapivlogin',
      apiUrl: 'https://mail.happy-phone.ru:4843/api/v1/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HttpdevhappygoonlineCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'httpdevhappygoonline',
      apiUrl: 'https://devhappygo.online/api/v1/orders',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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
