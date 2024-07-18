import 'package:flutter/material.dart';
import 'package:flutter_tirtakencana_tatawarna/constants/apps_color.dart';
import 'package:get/get.dart';
import 'package:flutter_tirtakencana_tatawarna/widgets/hadiah_dialog.dart';

class TotalHadiahButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: 40,
        decoration: BoxDecoration(
          color: Appscolor.buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.card_giftcard,
                color: Colors.white,
                size: 20,
              ),
              Text(
                'Total Hadiah',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Get.dialog(HadiahDialog());
      },
    );
  }
}
