import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gdg_flutter/configs/colors.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key,this.id}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();
   final ins = FirebaseAuth.instance;

   final id;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          padding: EdgeInsets.symmetric(horizontal: Space.x4),
          child: FormBuilder(
            key:  this.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: Space.x6,),
                Text("Welcome",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                Text("Sultan $id",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),),
                SizedBox(height: Space.x4),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Search for Keywords"
                  ),
                ),
                SizedBox(height: Space.x4),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/salesflo-logo.png"),
                      backgroundColor: AppColors.dark2,
                    ),
                    title: Text("FLutter developer required"),
                    subtitle: Text("Karachi, Pakistan"),
                    
                  ),
                ),
                SizedBox(height: Space.x1,),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(

                      radius: 20,
                      backgroundImage: AssetImage('images/google-logo.png',),
                      backgroundColor: AppColors.dark2,


                    ),

                    title: Text("UX / UI designer required"),
                    subtitle: Text("United States, America"),

                  ),
                ),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(

                      radius: 20,
                      backgroundImage: AssetImage('images/adobe-logo.png',),
                      backgroundColor: AppColors.dark2,

                    ),
                    title: Text("Full Stack Developer"),
                    subtitle: Text("Karachi, Pakistan"),

                  ),
                ),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(

                      radius: 20,
                      backgroundImage: AssetImage('images/unilever-logo.png',),
                      backgroundColor: AppColors.dark2,

                    ),
                    title: Text("Sales Manager"),
                    subtitle: Text("Karachi, Pakistan"),

                  ),
                ),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(

                      radius: 20,
                      backgroundImage: AssetImage('images/total-logo.png',),
                      backgroundColor: AppColors.dark2,

                    ),
                    title: Text("Project Manager"),
                    subtitle: Text("Karachi, Pakistan"),

                  ),
                ),
                SizedBox(height: Space.x3),
                ElevatedButton(onPressed: () async{
                  await ins.signOut();
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },

                    child: Text("Logout")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
