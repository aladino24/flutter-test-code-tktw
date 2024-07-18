import 'package:flutter/material.dart';
import 'package:flutter_tirtakencana_tatawarna/constants/apps_color.dart';

class HadiahItem extends StatelessWidget {
  final String title;
  final String jumlah;

  const HadiahItem({super.key, required this.title, required this.jumlah});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Appscolor.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Spacer(),
            Text(
              jumlah,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
