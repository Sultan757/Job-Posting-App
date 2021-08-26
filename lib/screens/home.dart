import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gdg_flutter/configs/colors.dart';
import 'package:gdg_flutter/utils/space.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();


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
                Text("Sultan Saeed",
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
                    leading: FlutterLogo(size: Space.x5,),
                    title: Text("FLutter developer required"),
                    subtitle: Text("Karachi, Pakistan"),
                    
                  ),
                ),
                SizedBox(height: Space.x1,),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(

                      radius: 25,
                      backgroundImage: AssetImage('images/flutter-logo.png',),
                      backgroundColor: AppColors.dark2,

                    ),
                    title: Text("UX / UI designer required"),
                    subtitle: Text("Karachi, Pakistan"),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
