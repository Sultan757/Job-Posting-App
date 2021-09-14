import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gdg_flutter/screens/home.dart';
import 'package:gdg_flutter/utils/googleSignIn.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';
import 'package:gdg_flutter/configs/colors.dart';
import 'package:flash/flash.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
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
                SizedBox(height: Space.x4,),
                Column(
                  children: [
                    FloatingActionButton.extended(onPressed: (){
                       signInWithGoogle().then((creds) {

                         final name = creds.user!.displayName;

                         Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(id: name)));});



                    },
                      backgroundColor: AppColors.white,
                      icon: Image.asset("images/google-logo.png",
                      height: 32,
                        width: 32,
                      ),
                      label: Text("Sign in With google",
                      style: TextStyle(color: AppColors.dark),
                      ),
                    )
                  ],
                ),

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
                ElevatedButton(onPressed: () async{
                  final flag = this.formKey.currentState!.saveAndValidate();
                  if(flag){
                    final data = this.formKey.currentState!.value;
                    final String email = data['email'];
                    final String  password = data['password'];
                    try{
                      _showBasicsFlash(context, "Loading");
                      UserCredential userCredential = await FirebaseAuth.instance.
                      createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );


                      _showBasicsFlash(context, "user logged in");
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, AppRoutes.home);

                    }on FirebaseAuthException catch (e){
                      var text = "FAILED";
                      if(e.code == "user-not-found")
                      {
                        text = "No user find for this email";
                      }
                      else if(e.code == "wrong-password")
                      {
                        text ="wrong password provided for this email";

                      }
                      _showBasicsFlash(context, text);

                    }
                    catch(e)
                    {
                      print(e);
                    }

                  }
                }, child: Text("Login"))
              ],
              ),
          ),
        ),
    ),
    );
  }
}
