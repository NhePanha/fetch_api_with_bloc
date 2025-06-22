import 'package:auth_with_api/home/auth/widget/custom_buttom.dart';
import 'package:auth_with_api/home/auth/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(hin: "username", icons: Icons.email, controllers: username),
            CustomTextfield(hin: "password", icons: Icons.email, controllers: password),
            CustomTextfield(hin: "password", icons: Icons.email, controllers: password),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("forgot password"), 
                InkWell(
                  onTap: (){
                    print("register");
                  },
                  child: Text("register",style: TextStyle(color: Colors.blue),)),
              ],
            ),
            SizedBox(height: 50),
            CustomButtom(
              title: "Sign Up", 
              colors: Colors.amber,
              onTap: (){
                print("object");

              },
            ), 
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/iconspng/apple.png",width: 30), 
                SizedBox(width: 10,),
                Image.asset("assets/icons/iconspng/email.png",width: 30,), 
                SizedBox(width: 10,),
                Image.asset("assets/icons/iconspng/facebook.png",width: 30,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}