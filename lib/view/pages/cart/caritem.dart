import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final int number;
  final String title;
  final int quantity;
  final int price;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.number,
    required this.title,
    required this.quantity,
    required this.price,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$number. ",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: Colors.grey.shade600,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: IconButton(
            icon: const Icon(Icons.remove, color: Colors.white, size: 18),
            onPressed: onRemove,
            padding: EdgeInsets.zero,
          ),
        ),
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          color: Colors.grey.shade200,
          child: Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 18),
            onPressed: onAdd,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          "₹$price",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
