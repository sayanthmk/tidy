import 'package:flutter/material.dart';
import 'package:serviceapp/constants/datas.dart';

class AvailableServiceItemsSection extends StatelessWidget {
  const AvailableServiceItemsSection({
    super.key,
    // required this.serviceCategories,
  });

  // final List<Map<String, dynamic>> serviceCategories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: serviceCategories.length,
      itemBuilder: (context, index) {
        final service = serviceCategories[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (index == serviceCategories.length - 1)
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.green),
              )
            else
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    service["image"],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: service["title"],
                style: const TextStyle(fontSize: 12),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        );
      },
    );
  }
}
