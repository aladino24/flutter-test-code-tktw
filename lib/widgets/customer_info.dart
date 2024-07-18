import 'package:flutter/material.dart';
import 'package:flutter_tirtakencana_tatawarna/constants/apps_color.dart';
import 'package:flutter_tirtakencana_tatawarna/controllers/customer_controller.dart';
import 'package:flutter_tirtakencana_tatawarna/controllers/hadiah_controller.dart';
import 'package:get/get.dart';

class CustomerInfo extends StatelessWidget {
  final String name;
  final String address;
  final String status;
  final String phone;
  final String custID;
  final String reason;

  CustomerInfo(
      {required this.name,
      required this.address,
      required this.status,
      required this.phone,
      required this.custID,
      required this.reason});

  final CustomerController _customerController = Get.find<CustomerController>();
  final HadiahController hadiahController = Get.put(HadiahController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 25,
        right: 25,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Appscolor.textColor,
                            fontSize: 15,
                          ),
                        ),
                        // icon arrow right
                        Icon(
                          Icons.arrow_right,
                          color: Appscolor.textColor,
                          size: 15,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Appscolor.textColor,
                          size: 18,
                        ),
                        Container(
                          width: Get.width * 0.4,
                          child: Text(
                            address,
                            style: TextStyle(
                              color: Appscolor.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  if (status != 'Sudah Diterima') {
                    Get.dialog(
                      AlertDialog(
                        title: Text(
                          'Sudah Terima TTH',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/person.png',
                                width: 128,
                                height: 128,
                              ),
                              Text('Yakin ingin menyimpan sudah terima TTH?'),
                            ],
                          ),
                        ),
                        actions: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Appscolor.primaryColor,
                              ),
                              color: Appscolor.textColor,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.back();
                                Get.dialog(
                                  Container(
                                    width: Get.width *
                                        0.8, // Set the width of the dialog
                                    child: AlertDialog(
                                      title: Text(
                                        'Gagal Terima TTH',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Appscolor.primaryColor,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Obx(() {
                                              return DropdownButton<String>(
                                                isExpanded: true,
                                                value: hadiahController
                                                    .selectedValue.value,
                                                onChanged: (String? newValue) {
                                                  if (newValue != null) {
                                                    hadiahController
                                                        .setSelectedValue(
                                                            newValue);
                                                  }
                                                },
                                                underline: SizedBox(),
                                                items: <String>[
                                                  'Pilih Alasan',
                                                  'Toko Tutup',
                                                  'Pemilik Sibuk',
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  bool isFirstItem =
                                                      value == 'Pilih Alasan';
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: isFirstItem
                                                                ? Appscolor
                                                                    .dangerColor
                                                                : Appscolor
                                                                    .secondaryColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color: Appscolor
                                                                .textColor,
                                                            size: 18,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(value),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                      actions: [
                                        Container(
                                          width: Get.width * 0.215,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Appscolor.primaryColor,
                                            ),
                                            color: Appscolor.textColor,
                                          ),
                                          child: TextButton(
                                            onPressed: () => Get.back(),
                                            child: Row(
                                              children: [
                                                // close icon
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color:
                                                        Appscolor.primaryColor,
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Appscolor.textColor,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  'BATAL',
                                                  style: TextStyle(
                                                      color: Appscolor
                                                          .primaryColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.06,
                                        ),
                                        Container(
                                          width: Get.width * 0.24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Appscolor.primaryColor,
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              _customerController
                                                  .rejectCustomer(
                                                      custID,
                                                      hadiahController
                                                          .selectedValue.value);
                                              Get.back();
                                            },
                                            child: Row(
                                              children: [
                                                // icon check
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    border: Border.all(
                                                      color:
                                                          Appscolor.textColor,
                                                    ),
                                                    color:
                                                        Appscolor.primaryColor,
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Appscolor.textColor,
                                                    size: 16,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  'SIMPAN',
                                                  style: TextStyle(
                                                      color:
                                                          Appscolor.textColor,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Text('TIDAK',
                                  style: TextStyle(
                                    color: Appscolor.primaryColor,
                                  )),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Appscolor.primaryColor,
                            ),
                            child: TextButton(
                              onPressed: () {
                                _customerController.acceptCustomer(custID);
                                Get.back();
                              },
                              child: Text('YA, SUDAH DITERIMA',
                                  style: TextStyle(
                                    color: Appscolor.textColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          color: Appscolor.textColor,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      // info icon
                      reason.isNotEmpty
                          ? Tooltip(
                              message: reason,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.info,
                                  color: Appscolor.textColor,
                                  size: 15,
                                ),
                                onTap: () {
                                  
                                },
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Appscolor.textColor,
                        size: 18,
                      ),
                      Text(
                        phone,
                        style: TextStyle(
                          color: Appscolor.textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
