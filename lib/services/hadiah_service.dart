// services/hadiah_service.dart

import 'dart:convert';
import 'package:flutter_tirtakencana_tatawarna/constants/api_url.dart';
import 'package:flutter_tirtakencana_tatawarna/models/total_hadiah.dart';
import 'package:http/http.dart' as http;

class HadiahService {
  static Future<TotalHadiahResult> fetchTotalHadiah() async {
    final response = await http.get(Uri.parse('${ApiUrl.baseUrl}mobileconfig/total-hadiah'));

    if (response.statusCode == 200) {
      return TotalHadiahResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load total hadiah');
    }
  }
}
