import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:visipay/core/constant/api.dart';

import 'jwt.dart';

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
  var session = await getJWT();

  String jwt = session ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiYTlmOWRiNDUtMmVmOS00MDcyLWFiMDEtNGYzZmRkYzc2Y2I2IiwibmFtZSI6IlN5YXJpaWYiLCJlbWFpbCI6ImFiZHVycmFtYW4xNDY3QGdtYWlsLmNvbSIsInBob25lIjoiNjI4MjE0MDAwMjg1MSJ9LCJpYXQiOjE2ODg3NDA1MDgsImV4cCI6MTY4ODkxMzMwOH0.NV_DIrla4UNozwhlpil14_DsegIpOjRKO9fK780AnSA";

  Map<String, String>? headers = {
    "Content-Type": "application/json",
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
