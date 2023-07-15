import 'package:flutter/material.dart';
import 'package:musico/models/music.dart';
import 'package:musico/screens/home.dart';
import 'package:musico/screens/playlists.dart';
import 'package:musico/screens/search.dart';
import 'package:musico/screens/yourlibrary.dart';
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
void initStrate(){
  super.initState();
  requestPermission();
}
void requestPermission(){
  Permission.storage.request();
}
  var Tabs = [];
  int currentTabIndex = 0;
 Music? music;
 Widget miniPlayer(Music? music) {
   this.music=music;
   setState(() {});
   if(music==null){
     return SizedBox();
   }
    Size deviceSize = MediaQuery
        .of(context)
        .size;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        color: Colors.brown,
        width: deviceSize.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
          Image.network(
          music.imageUrl,
          fit: BoxFit.cover,
        ),
        Text(music.name, style: TextStyle(color: Colors.white)
        ),
            IconButton(onPressed: (){}, icon:Icon(Icons.play_arrow),color: Colors.white,)
    ],
    ),
    );
  }
  //it will called only first rendering time.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs= [Home(miniPlayer), Search(), Yourlibrary(),PlayLists()];
  }
  //whole UI of the applivation goes inside build method of MyAppStateState class..
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:AppBar(title: Text('Musico App'),centerTitle: true,backgroundColor: Colors.greenAccent[200],),
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                currentTabIndex = currentIndex;
                //setState is used so app will be rerendered every time it changes currentIndex of bottomNavigationBar.
                setState(() {});
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.tealAccent[400],
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
                // label: Text('Home',style:TextStyle(color: Colors.white),

                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: 'search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_add,
                      color: Colors.white,
                    ),
                    label: 'Your library'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_add_check,
                      color: Colors.white,
                    ),
                    label: 'playlists'),
              ]),
        ],
      ),
    );
  }
}
