import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Elimina la cinta de "debug"
      title: 'Scalfold Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Scalfold Demo'),
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
  int _selectedIndex =0;
  int _counter = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home Page',
    ),
    Text(
      'Profile Page',
    )
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: drawerBody(),
      ),
      endDrawer: Drawer(
        //child: scrollableDrawerBody(),
      ),
      body: Center(
        child:
        _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItempTapped,
      ),
    );
  }

  Widget drawerBody() {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                  padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: FlutterLogo(
                      size: 30,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                child: ListTile(
                  title: Text("Javier Jimenez",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  subtitle: Text(
                    "ing.javierdavidjp@gmail.com",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    _onItempTapped(0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    _onItempTapped(1);
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  void _onItempTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
}
