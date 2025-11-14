import 'package:flutter/material.dart';

class AppFullTheme{
  static ThemeData LightTheme=AppTheme.LightTheme;
  static ThemeData DarkTheme=AppTheme.darkTheme;
}

class AppColors{
  static const Color primaryColor=Colors.deepPurple;
  static const Color secondaryColor=Colors.deepPurpleAccent;
  static const Color surface=Colors.white;
  static const Color backgroundColor=Colors.grey;
  static const Color textprimaryColor=Colors.black;
  static const Color textsecondaryColor=Colors.white;
}

class AppTextStyle{
  static const TextStyle heading1=TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle heading2=TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bodyText=TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle caption=TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}




class AppTheme{
  static ThemeData LightTheme=ThemeData(
    primaryColor:AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      //backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      displayLarge:AppTextStyle.heading1,
      displayMedium:AppTextStyle.heading2,
      bodyMedium:AppTextStyle.bodyText,
      bodySmall:AppTextStyle.caption

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),  
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),

  );

  static  ThemeData  darkTheme=ThemeData(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
     // backgroundColor: AppColors.backgroundColor,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
        displayLarge:AppTextStyle.heading1,
      displayMedium:AppTextStyle.heading2,
      bodyMedium:AppTextStyle.bodyText,
      bodySmall:AppTextStyle.caption
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
          

      )
      )
    ),
    


    

  );
}
 