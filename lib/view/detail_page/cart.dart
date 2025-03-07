import 'package:flutter/material.dart';
import 'package:serviceapp/constants/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildCartItem(1, "Kitchen Cleaning", 1, 125),
                  const SizedBox(height: 16),
                  _buildCartItem(2, "Fan Cleaning", 2, 225),
                  TextButton(
                    onPressed: () {},
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
                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildServiceCard(),
                        _buildServiceCard(),
                        _buildServiceCard(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
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
                            ),
                          ),
                          child: const Text(
                            "Coupon Code",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Coupon Code",
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: TidyColors.primarybuttongradient,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Apply",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                              _buildBillItem("Kitchen Cleaning", "₹499"),
                              const SizedBox(height: 12),
                              _buildBillItem("Fan Cleaning", "₹499"),
                              const SizedBox(height: 12),
                              _buildBillItem("Taxes and Fees", "₹50"),
                              const SizedBox(height: 12),
                              _buildBillItemWithAction(
                                  "Coupon Code", "-₹50", Icons.close),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Divider(color: Colors.grey),
                              ),
                              _buildBillItem("Total", "₹898", isBold: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
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
                      const Text("2 items  |  ₹3355",
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "VIEW CART",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(int number, String title, int quantity, int price) {
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
            onPressed: () {},
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
            onPressed: () {},
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

  _buildServiceCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                    image: AssetImage('assets/image5.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Bathroom Cleaning",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "₹500",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    // color: Colors.green,
                    gradient: TidyColors.primarybuttongradient,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () {},
                    constraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillItem(String title, String amount, {bool isBold = false}) {
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

  Widget _buildBillItemWithAction(String title, String amount, IconData icon) {
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

// const SizedBox(height: 16),

// // Cart Items
// _buildCartItem(1, "Kitchen Cleaning", 1, 125),
// const SizedBox(height: 16),
// _buildCartItem(2, "Fan Cleaning", 2, 225),

// // Add more services
// TextButton(
//   onPressed: () {},
//   style: TextButton.styleFrom(
//     padding: EdgeInsets.zero,
//     alignment: Alignment.centerLeft,
//   ),
//   child: const Text(
//     "Add more Services",
//     style: TextStyle(
//       color: Colors.green,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//     ),
//   ),
// ),

// const SizedBox(height: 24),

// // Frequently added services
// const Text(
//   "Frequently added services",
//   style: TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//   ),
// ),
// const SizedBox(height: 16),

// // Service cards
// SizedBox(
//   height: 180,
//   child: ListView(
//     scrollDirection: Axis.horizontal,
//     children: [
//       _buildServiceCard(),
//       _buildServiceCard(),
//       _buildServiceCard(),
//     ],
//   ),
// ),

// const SizedBox(height: 24),

// // Coupon Code Section
// Container(
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.grey.shade300),
//     borderRadius: BorderRadius.circular(12),
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12),
//           ),
//         ),
//         child: const Text(
//           "Coupon Code",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Enter Coupon Code",
//                   hintStyle:
//                       TextStyle(color: Colors.grey.shade400),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(
//                         color: Colors.grey.shade300),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 16),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             Container(
//               decoration: BoxDecoration(
//                 gradient: TidyColors.primarybuttongradient,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors
//                       .transparent, // Transparent to allow gradient
//                   shadowColor: Colors
//                       .transparent, // Remove default shadow
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 24, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Apply",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors
//                         .white, // Ensure text is visible on gradient
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),

// const SizedBox(height: 20),

// // Wallet balance
// Row(
//   children: [
//     Container(
//       padding: const EdgeInsets.all(8),
//       decoration: const BoxDecoration(
//         color: Colors.green,
//         shape: BoxShape.circle,
//       ),
//       child: const Icon(
//         Icons.check,
//         color: Colors.white,
//         size: 20,
//       ),
//     ),
//     const SizedBox(width: 10),
//     const Text(
//       "Your wallet balance is ₹125, you can redeem ₹10\nin this order.",
//       style: TextStyle(
//         fontSize: 14,
//         color: Colors.grey,
//       ),
//     ),
//   ],
// ),

// const SizedBox(height: 20),

// // Bill Details
// Container(
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.grey.shade300),
//     borderRadius: BorderRadius.circular(12),
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12),
//           ),
//         ),
//         child: const Text(
//           "Bill Details",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildBillItem("Kitchen Cleaning", "₹499"),
//             const SizedBox(height: 12),
//             _buildBillItem("Fan Cleaning", "₹499"),
//             const SizedBox(height: 12),
//             _buildBillItem("Taxes and Fees", "₹50"),
//             const SizedBox(height: 12),
//             _buildBillItemWithAction(
//                 "Coupon Code", "-₹50", Icons.close),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               child: Divider(color: Colors.grey),
//             ),
//             _buildBillItem("Total", "₹898", isBold: true),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),

// const SizedBox(height: 20),

// // Grand Total
// _buildFloatingCart()


  // Widget _buildFloatingCart() {
  //   return Positioned(
  //     bottom: 10,
  //     left: 16,
  //     right: 16,
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(12),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: Colors.black26,
  //             blurRadius: 8,
  //             spreadRadius: 1,
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text("2 items  |  ₹3355", style: TextStyle(fontSize: 16)),
  //           const SizedBox(height: 8),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.deepOrange,
  //               minimumSize: const Size(double.infinity, 50),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //             ),
  //             onPressed: () {},
  //             child: const Text(
  //               "VIEW CART",
  //               style: TextStyle(color: Colors.white, fontSize: 16),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
