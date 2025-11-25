import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/Provider/cart_provider.dart';
import 'package:theme/Screens/home_page.dart';
import 'package:theme/Screens/search_page.dart';
import 'package:theme/Screens/settings_page.dart';
import 'package:theme/theme.dart';
import 'Helper/shared_preference_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  bool isDarksaved = SharedPreferenceHelper.getBool("isDarkTheme")?? false;
  runApp( MyApp(isDark: isDarksaved,));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  const MyApp({super.key,required this.isDark});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDark;
  
  @override
  void initState() {
    super.initState();
    _isDark = widget.isDark;
  }
  
  void _toggleTheme()async{
    setState(() {
      _isDark = !_isDark; 
   
   SharedPreferenceHelper.setBool("isDarkTheme", _isDark);
   });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
        home:  MyHomePage(
          title: 'Flutter Demo Home Page',
          isDark:_isDark,
          onThemeToggle: _toggleTheme,),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
    required this.isDark,
    required this.onThemeToggle,});
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
 

  final List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      SearchPage(),
      SettingsPage(),
  ];
  void onitemTapped(int index){
    setState(() {
      _selectedIndex = index;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
        actions: [IconButton(onPressed: widget.onThemeToggle, icon: Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode))],
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onitemTapped,
      )
    );
  }
}
