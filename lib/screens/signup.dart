import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gdg_flutter/configs/colors.dart';
import 'package:gdg_flutter/utils/app.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';
import 'package:flash/flash.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();

  void _showBasicsFlash(
      BuildContext context,
      String text,
      ) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              text,
              style: TextStyle(
                color: AppColors.dark,
              ),
            ),
          ),
        );
      },
    );
  }

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
              ElevatedButton(onPressed:  () async{
                final flag = this.formKey.currentState!.saveAndValidate();
                if(flag){
                  final data = this.formKey.currentState!.value;
                  final String email = data['email'];
                  final String  password = data['password'];
                  final String name = data['name'];

                  try{
                    _showBasicsFlash(context, "Loading");
                    UserCredential userCredential = await FirebaseAuth.instance.
                    createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    await userCredential.user?.updateDisplayName(name);

                    _showBasicsFlash(context, "user registered");
                    Navigator.pushReplacementNamed(context, AppRoutes.home);

                  }on FirebaseAuthException catch (e){
                    var text = "FAILED";
                    if(e.code == "weak-password")
                    {
                      text = "The password is provided is too weak";
                    }
                    else if(e.code == "email-already-in-use")
                    {
                        text ="account is already exist for this email";

                    }
                    _showBasicsFlash(context, text);

                  }
                  catch(e)
                  {
                    print(e);
                  }

                }

              }, child: Text("Sign Up",),

              ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
