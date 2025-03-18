import 'package:flutter/material.dart';

class BillItem extends StatelessWidget {
  final String title;
  final String amount;
  final bool isBold;

  const BillItem({
    super.key,
    required this.title,
    required this.amount,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class BillItemWithAction extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const BillItemWithAction({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
