import 'package:flutter/material.dart';
import 'package:serviceapp/constants/datas.dart';

class CleaningServiceSection extends StatelessWidget {
  const CleaningServiceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeservices.length,
        itemBuilder: (context, index) {
          final service = homeservices[index];
          return Container(
            width: 180,
            margin: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == homeservices.length - 1 ? 16 : 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    service["image"],
                    height: 170,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  service["title"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
