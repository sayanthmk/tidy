import 'package:flutter/material.dart';
import 'package:serviceapp/constants/color.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryButton({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? TidyColors.primarybuttongradient
                : const LinearGradient(
                    colors: [Colors.transparent, Colors.transparent]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
