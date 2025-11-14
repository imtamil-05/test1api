import 'package:flutter/material.dart';
import 'package:theme/Screens/home_page.dart';
import 'package:theme/Screens/search_page.dart';
import 'package:theme/Screens/settings_page.dart';
import 'package:theme/theme.dart';
import 'Helper/shared_preference_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(const MyApp(isDark: false,));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  const MyApp({super.key,required this.isDark});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   bool _isDarkTheme= false;
  
  @override
  void initState() {
    super.initState();
    _isDarkTheme=SharedPreferenceHelper.getBool("isDarkTheme") ?? false;
  }
  
  void _toggleTheme(){
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    SharedPreferenceHelper.setBool("isDarkTheme", _isDarkTheme);
   });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _isDarkTheme = false;

  }
  

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

  void _toggleTheme(){
    setState(() {
      _isDarkTheme = !_isDarkTheme;
      SharedPreferenceHelper.setBool("isDarkTheme", _isDarkTheme);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
        actions: [IconButton(onPressed: _toggleTheme, icon: Icon(_isDarkTheme ? Icons.dark_mode : Icons.light_mode))],
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
