import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/constants/color.dart';
import 'package:serviceapp/controller/cart_items_controller.dart';
import 'package:serviceapp/view/pages/cart/billitem.dart';
import 'package:serviceapp/view/pages/cart/caritem.dart';
import 'package:serviceapp/view/pages/cart/coupon_container.dart';
import 'package:serviceapp/view/pages/cart/freequently_sec.dart';
import 'package:serviceapp/view/widgets/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceItemProvider serviceItemProvider =
        Provider.of<ServiceItemProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  size: 17, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<ServiceItemProvider>(
        builder: (context, cleaningServiceProvider, child) {
          final items = serviceItemProvider.items.values.toList();
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      if (items.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text(
                              "Your cart is empty",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            var quantity = cleaningServiceProvider
                                .getItemQuantity(item.id);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CartItem(
                                number: index + 1,
                                title: item.name,
                                quantity: quantity,
                                price: item.price.toInt() * quantity,
                                onAdd: () {
                                  cleaningServiceProvider.addItem(
                                      item.id, item.name, item.price);
                                },
                                onRemove: () {
                                  cleaningServiceProvider.decreaseItem(item.id);
                                },
                              ),
                            );
                          },
                        ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                        child: const Text(
                          "Add more Services",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Frequently added services",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const FrequentlyAddedSection(),
                      const SizedBox(height: 24),
                      const CouponContainer(),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              gradient: TidyColors.primarybuttongradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Your wallet balance is ₹125, you can redeem ₹10\nin this order.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Bill Details",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  ...items.map((item) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: BillItem(
                                          title: item.name,
                                          amount:
                                              "₹${(item.price * item.quantity).toStringAsFixed(0)}",
                                        ),
                                      )),
                                  if (items.isNotEmpty) ...[
                                    const SizedBox(height: 12),
                                    const BillItem(
                                        title: "Taxes and Fees", amount: "₹50"),
                                    const SizedBox(height: 12),
                                    const BillItemWithAction(
                                      title: "Wallet Credit",
                                      amount: "-₹10",
                                      icon: Icons.close,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16.0),
                                      child: Divider(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 12),
                                    BillItem(
                                      title: "Total",
                                      amount:
                                          "₹${(cleaningServiceProvider.totalAmount + 50 - 10).toStringAsFixed(0)}",
                                      isBold: true,
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 16,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "${cleaningServiceProvider.itemCount} ${cleaningServiceProvider.itemCount == 1 ? 'item' : 'items'},|  ₹${(cleaningServiceProvider.totalAmount + 50 - 10).toStringAsFixed(0)}",
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      CustomButton(
                        text: "Book Slot",
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Booking slot...'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        gradient: TidyColors.primarybuttongradient,
                        textColor: Colors.white,
                        borderRadius: 12.0,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: 50,
                        width: 350,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
