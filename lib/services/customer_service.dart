import 'dart:convert';
import 'package:flutter_tirtakencana_tatawarna/constants/api_url.dart';
import 'package:flutter_tirtakencana_tatawarna/models/customer_details.dart';
import 'package:http/http.dart' as http;
import '../models/customer.dart';

class CustomerService {
  static Future<List<Customer>> fetchCustomers() async {
    String url = '${ApiUrl.baseUrl}customer';
    final apiUrl = Uri.parse(url);
    
    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<Customer> fetchedCustomers = List<Customer>.from(jsonData['data'].map((x) => Customer.fromJson(x)));
        return fetchedCustomers;
      } else {
        print('Failed to load customers');
        return [];
      }
    } catch (e) {
      print('Exception caught: $e');
      return [];
    }
  }
  

  static Future<CustomerResult> fetchCustomersDetail() async {
    String url = '${ApiUrl.baseUrl}customer/detail';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CustomerResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load customers');
    }
  }

   static Future<bool> acceptCustomer(String custID) async {
    final response = await http.put(
      Uri.parse('${ApiUrl.baseUrl}customer/accept'),
      body: {'CustID': custID},
    );

    if (response.statusCode == 200) {
      return true; 
    } else {
      return false;
    }
  }

  static Future<bool> rejectCustomer(String custID, String? reason) async{
    final response = await http.put(
      Uri.parse('${ApiUrl.baseUrl}customer/reject'),
      body: {
        'CustID': custID,
        'reason': reason == 'Pilih Alasan' ? '' : reason,
      },
    );

    if (response.statusCode == 200) {
      return true; 
    } else {
      return false;
    }
  }
}
