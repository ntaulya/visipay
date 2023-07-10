import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> getClaims(String token) async {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

Future<void> saveJWT(String jwt) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwt', jwt);
}

Future<String?> getJWT() async {
  final prefs = await SharedPreferences.getInstance();
  var jwt = prefs.getString('jwt') ?? "";
  if (jwt!.isNotEmpty) {
    return jwt;
  } else {
    return null;
  }
}
