import 'package:flutter/material.dart';
import 'package:foodgo/models/burger.dart';
import 'package:foodgo/models/user.dart';
import 'package:foodgo/screens/ordersummary/success.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the singleton instance of User_app
    User_app user = User_app();
    double totalPrice = _calculateTotalPrice(user.shoppingCart);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order summary
            Text(
              'Order Summary',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Details
            Column(
              children: [
                summaryRow('Order', '\$${totalPrice.toStringAsFixed(2)}'),
                SizedBox(height: 10),
                summaryRow('Taxes', '\$0.30'), // Example fixed taxes
                SizedBox(height: 10),
                summaryRow('Delivery fees', '\$1.50'), // Example fixed delivery fee
                SizedBox(height: 20),
                Divider(thickness: 1),
                summaryRow('Total:', '\$${(totalPrice + 0.30 + 1.50).toStringAsFixed(2)}', isBold: true),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated delivery time:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '15 - 30 mins',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

            // Payment method
            Text(
              'Payment methods',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Changes position of shadow
                          ),
                        ],
                        color: Colors.white, // Make sure to set a background color
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                        ),
                        title: Text('Cash'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            // Total and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                totalPriceSection(totalPrice),
                SizedBox(width: 15),
                Container(
                  width: 209,
                  height: 70,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (c){
                          return SuccessPage();
                        })
                      );
                    },
                    color: Color(0xFF3C2F2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotalPrice(List<Map<Burger, int>> shoppingCart) {
    double total = 0.0;
    for (var item in shoppingCart) {
      item.forEach((burger, quantity) {
        total += burger.price * quantity; // Calculate total price
      });
    }
    return total;
  }

  Widget summaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isBold ? Colors.black : Color(0xFF7D7D7D),
            fontSize: 17,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isBold ? Colors.black : Color(0xFF7D7D7D),
            fontSize: 17,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget totalPriceSection(double totalPrice) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total price',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '\$${totalPrice.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
