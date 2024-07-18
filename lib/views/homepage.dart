import 'package:flutter/material.dart';
import 'package:flutter_tirtakencana_tatawarna/constants/apps_color.dart';
import 'package:flutter_tirtakencana_tatawarna/controllers/customer_controller.dart';
import 'package:flutter_tirtakencana_tatawarna/widgets/dropdown_widget.dart';
import 'package:flutter_tirtakencana_tatawarna/widgets/total_hadiah_button.dart';
import 'package:flutter_tirtakencana_tatawarna/widgets/customer_info.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerController controller = Get.put(CustomerController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appscolor.textColor,
        title: Row(
          children: [
            DropdownWidget(),
            const SizedBox(width: 10),
            TotalHadiahButton(),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Appscolor.primaryColor),
            child: ListView.builder(
              itemCount: controller.filteredCustomerList.length,
              itemBuilder: (context, index) {
                var customer = controller.filteredCustomerList[index];
                return Column(
                  children: [
                    CustomerInfo(
                      name: customer.name ?? 'Unknown',
                      address: customer.address ?? 'Unknown',
                      status: customer.tth != null && customer.tth!.isNotEmpty
                          ? customer.tth![0].received == 1
                              ? 'Sudah Diterima'
                              : customer.tth![0].receivedDate == '0000-00-00 00:00:00'
                                  ? 'Belum Diberikan'
                                  : 'Gagal Diterima'
                          : 'Belum Diberikan',
                      phone: customer.phoneNo ?? 'Unknown', 
                      custID: customer.custID!,
                      reason: customer.tth != null && customer.tth!.isNotEmpty
                          ? customer.tth![0].received == 0 && customer.tth![0].failedReason != null
                              ? customer.tth![0].failedReason ?? ''
                              : '' : '',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                      decoration: BoxDecoration(
                        color: Appscolor.textColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          customer.tth != null && customer.tth!.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: customer.tth!.length,
                                  itemBuilder: (context, tthIndex) {
                                    var tth = customer.tth![tthIndex];
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 0.04,
                                      margin: const EdgeInsets.only(bottom: 5),
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Appscolor.secondaryColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/gift.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            tth.tTOTTPNo ?? 'Unknown',
                                            style: TextStyle(
                                              color: Appscolor.textColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  child: Text(
                                    'No data available',
                                    style: TextStyle(color: Appscolor.textColor),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      }),
    );
  }
}
