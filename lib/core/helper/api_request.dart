import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:visipay/core/constant/api.dart';

// ignore: constant_identifier_names, camel_case_types
enum API_METHODS { GET, POST, PUT, PATCH, DELETE }

Future<Either<String, Response>> ApiRequest({
  required API_METHODS method,
  required String path,
  String apiUrl = ApiUrl.HOST,
  Map? payloadJson,
  // bool isAuthorization = false,
  Map<String, dynamic>? payloadQparams,
  List<String>? payloadUrlParams,
}) async {
  // String csrfToken = "";
  // String csrfToken = await updateCSRFToken(null);
  // var session = await UserSessionLocalDatasourceImpl().readUserSession();
  
  String jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiYTlmOWRiNDUtMmVmOS00MDcyLWFiMDEtNGYzZmRkYzc2Y2I2IiwibmFtZSI6IlN5YXJpaWYgQWJkIiwiZW1haWwiOiJzeWFyaWkxZkBtYWlsLmNvbSIsInBob25lIjoiNjI4MjE0MDAwMjg1MSJ9LCJpYXQiOjE2ODY4MDU2ODEsImV4cCI6MTY4Njk3ODQ4MX0.-IDGX0z5BPs3vxZViv8m3hya5spUe-0N88sKlROuZrA";
  // if (session.isRight()) {
  //   jwt = session.asRight().access_token;
  // }
  // ApiUrl.JWT = jwt;

  Map<String, String>? headers = {
    "Content-Type": "application/json",
    // "X-CSRF-Token": csrfToken,
    "Authorization": "Bearer $jwt"
  };

  Uri uriParse = Uri.parse(apiUrl).replace(path: path);
  var body = utf8.encode(jsonEncode({}));
  List<String> pathSegments = path.split('/');
  //CHECK PAYLOAD JSON

  if (payloadJson != null) {
    body = utf8.encode(jsonEncode(payloadJson));
  }

  //CHECK PAYLOAD URL PARAMS
  if (payloadUrlParams != null && payloadUrlParams.isNotEmpty) {
    pathSegments = [...pathSegments, ...payloadUrlParams];
  }

  uriParse = Uri.parse(apiUrl).replace(
    queryParameters: payloadQparams,
    pathSegments: pathSegments.isNotEmpty ? pathSegments : [],
  );

  Response? res;
  if (method == API_METHODS.GET) {
    res = await get(
      uriParse,
      headers: headers,
    );
  } else if (method == API_METHODS.POST) {
    res = await post(
      uriParse,
      headers: headers,
      body: body,
    );
  } else if (method == API_METHODS.PUT) {
    res = await put(
      uriParse,
      headers: headers,
      body: body,
    );
  } else if (method == API_METHODS.PATCH) {
    res = await patch(
      uriParse,
      headers: headers,
      body: body,
    );
  } else if (method == API_METHODS.DELETE) {
    res = await delete(
      uriParse,
      headers: headers,
      body: body,
    );
  }
  if (res == null) {
    return Future.value(Left("Api Failure"));
  }
  return Future.value(Right(res));
}
