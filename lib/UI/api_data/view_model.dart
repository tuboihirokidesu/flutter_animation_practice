import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final configProvider = FutureProvider<Map<String, Object?>>((ref) async {
  final response = await http.get(Uri.https(
    'api.github.com',
    'user/orgs',
  ));
  return json.decode(response.body);
});
