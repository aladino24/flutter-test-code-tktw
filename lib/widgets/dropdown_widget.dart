import 'package:flutter/material.dart';
import 'package:flutter_tirtakencana_tatawarna/constants/apps_color.dart';
import 'package:get/get.dart';
import 'package:flutter_tirtakencana_tatawarna/controllers/customer_controller.dart';

class DropdownWidget extends StatelessWidget {
  

  DropdownWidget({super.key});


  final CustomerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Appscolor.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.dropdownValue.value,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.setDropdownValue(newValue);
              }
            },
            items: controller.dropdownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
