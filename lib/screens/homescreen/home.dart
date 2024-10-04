import 'package:flutter/material.dart';
import 'package:foodgo/models/burger.dart';
import 'package:foodgo/models/user.dart';
import 'package:foodgo/screens/burger/burgescreen.dart';
import 'package:foodgo/screens/burger/cart.dart';
import 'package:foodgo/screens/burger/favorite.dart';
import 'package:foodgo/screens/profile/profile.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController search = TextEditingController();
  final List<String> items = ['All', 'Combos', 'Sliders', 'Classic'];
  int _selectedIndex = 0;

  User_app user=User_app();

  // Initialize Burger objects
  Burger b1 = Burger(
      url_image: 'assets/images/img_3.png',
      name: 'Cheeseburger',
      subtitle: 'Wendy\'s Burger',
      about: 'The Cheeseburger Wendy\'s Burger is a classic fast '
          'food burger that packs a punch of flavor in every bite. Made '
          'with a juicy beef patty cooked to perfection, it\'s topped with melted '
          'American cheese, crispy lettuce, ripe tomato, and crunchy pickles.',
      price: 8.24,
      time: 26,
      rating: 4.8);
  Burger b2 = Burger(
      url_image: 'assets/images/img_4.png',
      name: 'Hamburger',
      subtitle: 'Veggie Burger',
      about: 'Enjoy our delicious Hamburger Veggie Burger, '
          'made with a savory blend of fresh vegetables and '
          'herbs, topped with crisp lettuce, juicy tomatoes, '
          'and tangy pickles, all served on a soft, toasted bun.',
      price: 9.99,
      time: 14,
      rating: 4.8);
  Burger b3 = Burger(
      url_image: 'assets/images/img_7.png',
      name: 'Hamburger',
      subtitle: 'Chicken Burger',
      about: 'Our chicken burger is a delicious and healthier '
          'alternative to traditional beef burgers, perfect for '
          'those looking for a lighter meal option. Try it today and '
          'experience the mouth-watering flavors of our Hamburger Chicken '
          'Burger!',
      price: 12.48,
      time: 42,
      rating: 4.6);
  Burger b4 = Burger(
      url_image: 'assets/images/img_6.png',
      name: 'Hamburger',
      subtitle: 'Fried Chicken Burger',
      about: 'Indulge in our crispy and savory Fried Chicken Burger, '
          'made with a juicy chicken patty, hand-breaded and deep-fried '
          'to perfection, served on a warm bun with lettuce, tomato, and a '
          'creamy sauce.',
      price: 26.99,
      time: 14,
      rating: 4.5);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective page based on the index
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())); // Navigate to CategoryScreen
    } else if (index == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Favorites()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodCartScreen())); // Example, replace with actual ProfileScreen

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              // Header
              ListTile(
                title: Text(
                  'Foodgo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Order your favourite food!',
                  style: TextStyle(color: Color(0xFF6A6A6A), fontSize: 18),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/img_2.png'),
                  radius: 30,
                ),
              ),
              SizedBox(height: 15,),

              // search bar and settings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 319,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        // Align content vertically
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.redAccent, // لون الخلفية
                      borderRadius: BorderRadius.circular(20), // زوايا دائرية
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings, size: 25, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              // List of items
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.redAccent, // لون الخلفية
                            borderRadius: BorderRadius.circular(20), // زوايا دائرية
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), // لون الظل
                                spreadRadius: 3, // زيادة spreadRadius
                                blurRadius: 10, // زيادة blurRadius
                                offset: Offset(0, 3), // موقع الظل
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Burger cards section with horizontal scrolling
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Cerdstyle(b1, context),
                          Cerdstyle(b2, context),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Cerdstyle(b3, context),
                          Cerdstyle(b4, context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.red,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              _buildBottomNavigationBarItem(Icons.home_outlined, 0, 'Home'),
              _buildBottomNavigationBarItem(Icons.account_circle_outlined, 1, 'Profile'),
              _buildBottomNavigationBarItem(Icons.favorite_border, 2, 'Favorite'),
              _buildBottomNavigationBarItem(Icons.shopping_cart_outlined, 3, 'Cart'),
            ],
          ),
        ));
  }

  // Navigator bar
  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, int index, String text) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          if (_selectedIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
        ],
      ),
      label: text,
    );
  }

  // Modify the Cerdstyle method to accept a Burger object and display its details
  Widget Cerdstyle(Burger b , BuildContext context) {
    bool isFavorite = user.favorites.contains(b);
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (c){
                  return BurgerScreen(burger: b);
                })
            );
          },
          child:Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            child: Container(
              width: 185,
              height: 242,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the burger image dynamically
                  Center(child: Image.asset(b.url_image, scale: 2)),
                  SizedBox(height: 5),

                  // Display burger name dynamically
                  Text(
                    b.name,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),

                  // Display burger subtitle dynamically
                  Text(
                    b.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),

                  // Row for rating and favorite icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_sharp,
                            color: Color(0xFFFF9633),
                            size: 30,
                          ),
                          SizedBox(width: 5),

                          // Display the rating dynamically
                          Text(
                            b.rating.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isFavorite) {
                              user.favorites.remove(b);
                            } else {
                              user.favorites.add(b);
                              print( user.favorites.first.name);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
