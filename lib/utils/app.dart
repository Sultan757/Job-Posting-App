import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gdg_flutter/configs/colors.dart';
import 'package:gdg_flutter/screens/home.dart';
import 'package:gdg_flutter/screens/login.dart';
import 'package:gdg_flutter/screens/signup.dart';
import 'package:gdg_flutter/screens/splash.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';
import 'package:google_fonts/google_fonts.dart';



class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: AppColors.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.white,
            onPrimary: AppColors.dark,
          padding: EdgeInsets.symmetric(vertical: Space.x4),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),

          ),

        ),

    textTheme: GoogleFonts.poppinsTextTheme(TextTheme()).copyWith(
      bodyText1: TextStyle(
        color:  AppColors.white,
        fontWeight: FontWeight.w300,

          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color:  AppColors.grey,
          ),
          filled: true,
          fillColor: AppColors.dark2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.white)
          ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.white)
        ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular((8)),
                borderSide: BorderSide(color: AppColors.grey)
            )
        ),
        cardColor: AppColors.dark2,
      
      ),

        initialRoute: AppRoutes.splash,
       routes:{
         AppRoutes.splash: (context) => SplashScreen(),
         AppRoutes.signup: (context) => SignUpScreen(),
         AppRoutes.home: (context) => HomeScreen(),
         AppRoutes.login: (context) => LoginScreen(),
      } ,
    );
  }
}
