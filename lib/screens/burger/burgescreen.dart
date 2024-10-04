import 'package:flutter/material.dart';
import 'package:foodgo/models/burger.dart';
import 'package:foodgo/models/user.dart';

class BurgerScreen extends StatefulWidget {
  final Burger burger;

  const BurgerScreen({Key? key, required this.burger}) : super(key: key);

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  double _spiceLevel = 0.5;
  int quantity = 1;
  User_app user=User_app();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
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
        padding: const EdgeInsets.all(8.0),
        child:SingleChildScrollView(child: Column(
          children: [
            // Image
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  widget.burger.url_image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Name and about
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.burger.name} ${widget.burger.subtitle}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star_sharp, color: Color(0xFFFF9633), size: 28),
                    SizedBox(width: 5),
                    Text(
                      '${widget.burger.rating} - ${widget.burger.price} USD',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  widget.burger.about,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Spice Level and Quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSpiceLevelSlider(),
                _buildQuantitySelector(),
              ],
            ),
            SizedBox(height: 10),

            // Price and button
            _buildPriceAndButton(),
          ],
        ),
      ),
    )
    );
  }

  // Methods for building the spice level slider, quantity selector, and price button
  Widget _buildSpiceLevelSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
      children: [
        Text(
          'Spicy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Slider(
          value: _spiceLevel,
          min: 0,
          max: 1,
          activeColor: Colors.redAccent, // Red color for the active part
          inactiveColor: Colors.grey[300], // Light grey for the inactive part
          onChanged: (value) {
            setState(() {
              _spiceLevel = value;
            });
          },
        ),
        Row(
          children: [
            Text(
              'Mild',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 130,),
            Text(
              'Hot',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Column(
      children: [
        Text(
          'Portion',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 10), // Adds spacing between title and selector
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the Row
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent, // Red background
                borderRadius: BorderRadius.circular(19), // Rounded corners
              ),
              child: IconButton(
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '$quantity',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent, // Red background
                borderRadius: BorderRadius.circular(19), // Rounded corners
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 104,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.redAccent, // Background color
            border: Border.all(
              width: 2, // Border width
              color: Colors.redAccent, // Border color (same as background to blend)
            ),
            borderRadius: BorderRadius.circular(30), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 4, // Blur radius
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          padding: EdgeInsets.all(8), // Padding inside the container
          child: Center(
            child: Text(
              '\$${(widget.burger.price * quantity).toStringAsFixed(2)}', // Price only
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 20, // Font size (optional)
                fontWeight: FontWeight.bold, // Font weight (optional)
              ),
            ),
          ),
        ),
        Container(
          width: 239,
          height: 70,
          child: MaterialButton(
            onPressed: () {
              // Check if the burger already exists in the shopping cart
              bool burgerExists = false;
              for (var item in user.shoppingCart) {
                if (item.containsKey(widget.burger)) {
                  // If the burger already exists, update the quantity
                  item[widget.burger] = (item[widget.burger] ?? 0) + quantity;
                  burgerExists = true;
                  break;
                }
              }

              // If the burger does not exist, add a new entry
              if (!burgerExists) {
                user.shoppingCart.add({widget.burger: quantity});
              }

              // Show a snackbar when the burger is added to the cart
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to the cart successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            color: Color(0xFF3C2F2F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
