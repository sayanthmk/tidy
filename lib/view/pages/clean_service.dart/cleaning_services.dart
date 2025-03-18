import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/constants/datas.dart';
import 'package:serviceapp/controller/cart_items_controller.dart';
import 'package:serviceapp/view/pages/clean_service.dart/category_button.dart';
import 'package:serviceapp/view/pages/clean_service.dart/floating_button.dart';
import 'package:serviceapp/view/pages/clean_service.dart/service_card.dart';

class CleaningServicesDetailScreen extends StatelessWidget {
  const CleaningServicesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceItemProvider(),
      child: Consumer<ServiceItemProvider>(
        builder: (context, cart, child) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Cleaning Services",
                style: TextStyle(color: Colors.black, fontSize: 20),
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
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.green[100],
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryButton(
                            title: "Deep cleaning",
                            isSelected: false,
                          ),
                          CategoryButton(
                            title: "Maid Services",
                            isSelected: true,
                          ),
                          CategoryButton(
                            title: "Car Cleaning",
                            isSelected: false,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 100),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return CleaningServiceCard(
                            id: service['id'] as String,
                            name: service['name'] as String,
                            rating: service['rating'] as double,
                            orders: service['orders'] as int,
                            duration: service['duration'] as String,
                            price: service['price'] as double,
                            image: service['image'] as String,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                cart.itemCount > 0
                    ? FloatingCart(
                        itemCount: cart.itemCount,
                        totalPrice: cart.totalAmount,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}







// Cart Item model
// class CartItemModel {
//   final String id;
//   final String name;
//   final double price;
//   int quantity;

//   CartItemModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     this.quantity = 0,
//   });

//   double get totalPrice => price * quantity;
// }

// Cart Provider for state management
// class CartProvider extends ChangeNotifier {
//   final Map<String, CartItemModel> _items = {};

//   Map<String, CartItemModel> get items => _items;

//   int get itemCount {
//     return _items.values.fold(0, (sum, item) => sum + item.quantity);
//   }

//   double get totalAmount {
//     return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
//   }

//   void addItem(String id, String name, double price) {
//     if (_items.containsKey(id)) {
//       _items[id]!.quantity++;
//     } else {
//       _items[id] = CartItemModel(
//         id: id,
//         name: name,
//         price: price,
//         quantity: 1,
//       );
//     }
//     notifyListeners();
//   }

//   void decreaseItem(String id) {
//     if (!_items.containsKey(id)) return;

//     if (_items[id]!.quantity > 1) {
//       _items[id]!.quantity--;
//     } else {
//       _items.remove(id);
//     }
//     notifyListeners();
//   }

//   void removeItem(String id) {
//     _items.remove(id);
//     notifyListeners();
//   }

//   bool isInCart(String id) {
//     return _items.containsKey(id);
//   }

//   int getItemQuantity(String id) {
//     return _items.containsKey(id) ? _items[id]!.quantity : 0;
//   }
// }