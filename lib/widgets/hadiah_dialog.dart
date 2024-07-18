import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tirtakencana_tatawarna/controllers/hadiah_controller.dart';
import 'package:flutter_tirtakencana_tatawarna/widgets/hadiah_item.dart';

class HadiahDialog extends StatelessWidget {
  final HadiahController controller = Get.put(HadiahController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/presents.png',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 10),
                  const Text(
                    'Total Hadiah',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.teal[600],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 16,
                  color: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.green[600],
            thickness: 3,
          )
        ],
      ),
      content: Container(
        padding: const EdgeInsets.only(top: 16.0),
        width: 80,
        height: 180.0,
        child: Obx(() {
          if (controller.hadiahList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.hadiahList.length,
                    itemBuilder: (context, index) {
                      final hadiah = controller.hadiahList[index];
                      return HadiahItem(title: hadiah.jenis, jumlah: '${hadiah.sumQty} ${hadiah.details.first.unit}');
                    },
                  ),
                ],
              ),
            );
          }
        }),
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Divider(
              color: Colors.green[600],
              thickness: 3,
            ),
            Obx(() {
              return Text(
                '${controller.totalHadiah} Hadiah',
                style: TextStyle(fontSize: 16.0),
              );
            })
          ],
        ),
      ],
    );
  }
}