import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';
import 'package:gdg_flutter/configs/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Space.x4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              (
              SizedBox(height: Space.x5,)),
              Text("Let's Sign You in", style: TextStyle(fontSize: 35 , fontWeight: FontWeight.w900),),
              Text("Welcome back!\nyou've been missed", style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w200),),
              SizedBox(height: Space.x3,),
              SizedBox(height: Space.x3,),
              SizedBox(height: Space.x3,),
              FormBuilderTextField(
                name: "email",
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context,
                errorText: "Your Email is not valid"
                  )
                ])
              ),
              SizedBox(height: Space.x3,),
              FormBuilderTextField(
                  name: "password",
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "password is not correct"
                    )
                  ])
              ),
              SizedBox(height: Space.x6,),
              SizedBox(height: Space.x6,),
              SizedBox(height: Space.x6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? ",  style: TextStyle(color: AppColors.grey,fontSize: 15),),
                  GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, AppRoutes.signup ),
                    child: Text("Register", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w300, fontSize: 15),),
                  )
                ],

              ),
              SizedBox(height: Space.x3,),
              ElevatedButton(onPressed: (){}, child: Text("Login"))
            ],
            ),
        ),
    ),
    );
  }
}
