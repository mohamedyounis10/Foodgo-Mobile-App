import 'package:flutter/material.dart';
import 'package:foodgo/models/user.dart';
import 'package:foodgo/screens/burger/favorite.dart';
import 'package:foodgo/screens/profile/Myaccount.dart';
import 'package:foodgo/screens/profile/setlocation.dart';
import 'package:foodgo/screens/signinscreen/signinscreen.dart';
import 'helpcenter.dart';


class ProfilePage extends StatelessWidget {
  User_app user=User_app();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Profile' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.all(15),
            child:
            Row(
              children: [
                CircleAvatar(radius: 30,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/img_2.png',),),
                SizedBox(width: 15,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.fullname,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                      ,),
                    Text(user.phonenumber,style: TextStyle(
                        color: Colors.grey),
                    )
                  ],
                ),
                Spacer(),
                TextButton(onPressed: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext build) {
                        return FractionallySizedBox(
                          heightFactor: 0.4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Logout Title
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  // Description text
                                  Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20),

                                  // Logout button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: ()  {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (c){
                                           return Signinscreen();
                                          })
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 4,
                                        backgroundColor: Colors.red, // Set background color
                                        padding: EdgeInsets.symmetric(vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(fontSize: 20,color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),

                                  // Cancel button
                                  SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26, // Shadow color
                                            blurRadius: 10, // How soft the shadow is
                                            offset: Offset(0, 5), // Position of the shadow (horizontal, vertical)
                                          ),
                                        ],
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Close the dialog
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.black, // Text color when pressed
                                          padding: EdgeInsets.symmetric(vertical: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          backgroundColor: Colors.white, // Button background color
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red, // Set text color to yellow
                                            fontWeight: FontWeight.bold, // Make the text bold (optional)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                  child: Text('Logout',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red
                  ),),
                )
              ],
            ),
          ),

          Divider(),
          Padding(padding: EdgeInsets.all(10)),

          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor:Colors.grey.shade200,
              child:Icon(Icons.person,color: Colors.red,),
            ),

            title: Text('My Account',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c){
                  return Myaccount();
                })
              );
            },

          ),
          Padding(padding: EdgeInsets.all(15)),

          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor:Colors.grey.shade200,
              child:Icon(Icons.location_on,color: Colors.red,),
            ),

            title: Text('Address',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext build) {
                    return FractionallySizedBox(
                        heightFactor: 0.4,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Address icon on the left
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.location_pin,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                // Content on the right
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Address',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        user.address,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                                        softWrap: true, // Ensures text wraps if too long
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (c){
                                                    return SetLocationScreen();
                                                  })
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              'Set Address',
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  });
            },
          ),
          Padding(padding: EdgeInsets.all(15)),

          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor:Colors.grey.shade200,
              child:Icon(Icons.favorite,color: Colors.red,),
            ),

            title: Text('Your Favorites',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (c){
                    return Favorites();
                  })
              );
            },
          ),
          Padding(padding: EdgeInsets.all(15)),

          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor:Colors.grey.shade200,
              child: Icon(Icons.help,color: Colors.red,),
            ),
            title: Text('Help Center',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (c){
                    return Helpscreen();
                  })
              );
            },
          )

        ],
      ),
    );
  }
}
