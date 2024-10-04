import 'package:flutter/material.dart';
import 'package:foodgo/models/user.dart';
import 'package:foodgo/screens/burger/burgescreen.dart';
import '../../models/burger.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
 User_app user=User_app();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: user.favorites.isEmpty
            ? Center(child: Text('No favorites found.'))
            : ListView.builder(
          itemCount: user.favorites.length,
          itemBuilder: (context, index) {
            return _buildFavoriteBurgerItem(user.favorites[index]);
          },
        ),
      ),
    );
  }

  Widget _buildFavoriteBurgerItem(Burger burger) {
    return InkWell(onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (c){
          return BurgerScreen(burger: burger);
        })
      );
    },
        child:ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Image.asset(burger.url_image, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(burger.name),
      subtitle: Text('Description: ${burger.subtitle}'), // Display burger subtitle (description)
      trailing: IconButton(
        icon: Icon(Icons.favorite, color: Colors.red),
        onPressed: () {
          // Handle removal of the burger from favorites
          _removeBurgerFromFavorites(burger);
        },
      ),
    ));
  }

  void _removeBurgerFromFavorites(Burger burger) {
    setState(() {
      user.favorites.remove(burger);
    });
  }
}
