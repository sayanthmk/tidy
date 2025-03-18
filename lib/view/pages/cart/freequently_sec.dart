import 'package:flutter/material.dart';
import 'package:serviceapp/controller/cart_items_controller.dart';
import 'package:serviceapp/view/pages/cart/cart_service_card.dart';

class FrequentlyAddedSection extends StatelessWidget {
  const FrequentlyAddedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ServiceItemProvider cleaningServiceProvider = ServiceItemProvider();
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ServiceCard(
            imagePath: 'assets/image5.png',
            title: 'Bathroom Cleaning',
            price: '₹499',
            onAdd: () {
              cleaningServiceProvider.addItem(
                'service_1',
                'Bathroom Cleaning',
                499.0,
              );
            },
          ),
          ServiceCard(
            imagePath: 'assets/image5.png',
            title: 'Kitchen Cleaning',
            price: '₹599',
            onAdd: () {
              cleaningServiceProvider.addItem(
                'service_2',
                'Kitchen Cleaning',
                599.0,
              );
            },
          ),
          ServiceCard(
            imagePath: 'assets/image5.png',
            title: 'Sofa Cleaning',
            price: '₹299',
            onAdd: () {
              cleaningServiceProvider.addItem(
                'service_3',
                'Sofa Cleaning',
                299.0,
              );
            },
          ),
        ],
      ),
    );
  }
}
