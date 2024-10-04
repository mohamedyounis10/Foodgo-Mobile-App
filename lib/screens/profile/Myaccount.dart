import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../models/burger.dart';

class Myaccount extends StatefulWidget {
  @override
  _MyaccountState createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
  User_app user = User_app();

  // Data
  bool showPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with user data
    nameController.text = user.fullname;
    emailController.text = user.email;
    phoneController.text = user.phonenumber;
    passwordController.text = user.password;
  }

  // Function to update user data
  void updateUserData() {
    setState(() {
      user.fullname = nameController.text;
      user.email = emailController.text;
      user.phonenumber = phoneController.text;
      user.password = passwordController.text;
      print(user.password);
    });
    // Optionally show a snackbar or toast for confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User data updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Account', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  backgroundImage: AssetImage('assets/images/img_2.png'),
                  radius: 45,
                ),
              ),
              SizedBox(height: 10),

              // Name
              buildTextField("Name", nameController, "Your Name"),
              // Email
              buildTextField("Email", emailController, "Your Email"),
              // Phone number
              buildTextField("Phone number", phoneController, "Your Phone number"),
              // Password
              buildPasswordField("Password", passwordController),

              // Save changes button
              SizedBox(height: 30),
              Container(
                width: 327,
                height: 48,
                child: MaterialButton(
                  onPressed: updateUserData, // Call updateUserData
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Container(
          width: 327,
          height: 56,
          color: Color(0xFFF5F5F5),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Container(
          width: 327,
          height: 56,
          color: Color(0xFFF5F5F5),
          child: TextFormField(
            controller: controller,
            obscureText: showPassword,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 16, color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              hintText: 'Your Password',
              hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
