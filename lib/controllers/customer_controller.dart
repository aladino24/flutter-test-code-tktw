import 'package:flutter/material.dart';
import 'package:flutter_tirtakencana_tatawarna/models/customer.dart';
import 'package:flutter_tirtakencana_tatawarna/models/customer_details.dart';
import 'package:get/get.dart';
import 'package:flutter_tirtakencana_tatawarna/services/customer_service.dart';

class CustomerController extends GetxController {
  var isLoading = true.obs;
  var dropdownValue = 'Semua Toko'.obs;
  RxList<Customer> customers = RxList<Customer>();
  RxList<String> dropdownItems = RxList<String>(['Semua Toko']);
  var customerList = <Data>[].obs;
  var filteredCustomerList = <Data>[].obs;

  @override
  void onInit() {
    fetchCustomers();
    fetchCustomersDetail();
    super.onInit();
  }

  void setDropdownValue(String value) {
    dropdownValue.value = value;
    filterCustomerList();
  }

  Future<void> fetchCustomers() async {
    try {
      List<Customer> fetchedCustomers = await CustomerService.fetchCustomers();
      customers.assignAll(fetchedCustomers);

      dropdownItems.clear();
      dropdownItems.add('Semua Toko');
      dropdownItems.addAll(fetchedCustomers.map((customer) => customer.name ?? 'Unknown'));
      if (dropdownItems.isNotEmpty) {
        setDropdownValue(dropdownItems.first);
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> fetchCustomersDetail() async {
    try {
      isLoading(true);
      CustomerResult customerResult = await CustomerService.fetchCustomersDetail();
      if (customerResult.data != null) {
        customerList.value = customerResult.data!;
        filterCustomerList();
      }
    } finally {
      isLoading(false);
    }
  }

  void filterCustomerList() {
    if (dropdownValue.value == 'Semua Toko') {
      filteredCustomerList.value = customerList;
    } else {
      filteredCustomerList.value = customerList.where((customer) => customer.name == dropdownValue.value).toList();
    }
  }

   Future<void> acceptCustomer(String custID) async {
    isLoading.value = true; 
    bool success = await CustomerService.acceptCustomer(custID);
    isLoading.value = false; 

   if (success) {
      await fetchCustomersDetail();
      Get.snackbar(
        'Success', 
        'TTH telah diterima',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    
    } else {
      Get.snackbar(
        'Error', 
        'Failed to update data',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> rejectCustomer(String custID, String? reason) async {
    isLoading.value = true; 
    bool success = await CustomerService.rejectCustomer(custID, reason);
    isLoading.value = false; 

    if (success) {
      await fetchCustomersDetail();
      Get.snackbar(
        'Success', 
        'TTH telah ditolak',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error', 
        'Failed to update data',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
