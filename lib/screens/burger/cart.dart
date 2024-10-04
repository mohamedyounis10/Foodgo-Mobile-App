import 'package:flutter/material.dart';
import 'package:foodgo/models/user.dart';
import 'package:foodgo/screens/burger/burgescreen.dart';
import 'package:foodgo/screens/ordersummary/order.dart';

import '../../models/burger.dart';

class FoodCartScreen extends StatefulWidget {
  @override
  State<FoodCartScreen> createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {

User_app user=User_app();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, size: 28),
        ),
      ),
      body: user.shoppingCart.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 100,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Text(
              'There are no products in your cart.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: user.shoppingCart.length,
              itemBuilder: (context, index) {
                final cartItem = user.shoppingCart[index];
                final burger = cartItem.keys.first as Burger; // Change to Burger
                final numberOfCopies = cartItem.values.first;

                return ListTile(
                  leading: Image.asset(
                    burger.url_image, // Use burger image URL
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(burger.name), // Display burger name
                  subtitle: Text('Price: \$${burger.price.toStringAsFixed(2)}\nCopies: $numberOfCopies'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        // Find the index of the cart item
                        final indexToRemove = user.shoppingCart.indexWhere((item) => item.keys.first == burger);
                        // Remove the burger from the cart
                       user.shoppingCart.removeAt(indexToRemove);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurgerScreen(burger: burger), // Use BurgerScreen
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 327,
              height: 56,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) {
                    return Order();
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
