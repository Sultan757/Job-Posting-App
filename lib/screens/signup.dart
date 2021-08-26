import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gdg_flutter/configs/colors.dart';
import 'package:gdg_flutter/utils/app.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Space.x4),


          child: FormBuilder(
            key: this.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: Space.x5,
                ),
                Text(
                    "Let's Sign You Up!",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                Text("Welcome\njoin the Community",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
                ),
                SizedBox(height: Space.x3),
                SizedBox(height: Space.x3),
                SizedBox(height: Space.x3),
                FormBuilderTextField(
                    name: "name",
                decoration: InputDecoration(labelText: "Full Name"),
                 validator: FormBuilderValidators.compose([
                     FormBuilderValidators.required(
                         context,
                       errorText: "Please Input a valid name"
                     )]),
                ),
                SizedBox(
                  height: Space.x3,
                ),

                FormBuilderTextField(
                  name: "email",
                  decoration: InputDecoration(labelText: "Email"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        context,
                        errorText: "Please Input a valid email address"
                    )]),
                ),
                SizedBox(
                  height: Space.x3,
                ),
                FormBuilderTextField(
                  name: "password",
                  decoration: InputDecoration(labelText: "Password"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        context,
                        errorText: "Please Input a valid password"
                    )]),
                ),
                SizedBox(height: Space.x6,),
                SizedBox(height: Space.x6,),
                SizedBox(height: Space.x6,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Already have an account ? ",  style: TextStyle(color: AppColors.grey,fontSize: 15),),
                   GestureDetector(
                     onTap: ()=>Navigator.pushNamed(context, AppRoutes.login),
                     child: Text("Sign in", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300, fontSize: 15),),
                   )
                 ],

               ),
              SizedBox(height: Space.x3,),
              ElevatedButton(onPressed: (){}, child: Text("Sign Up",),

              ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
