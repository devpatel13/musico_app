
import 'package:flutter/material.dart';
import 'package:musico/models/music.dart';
import 'package:musico/services/category_operations.dart';
import 'package:musico/services/music_operations.dart';
import '../models/category.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);
  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // elevation property controls the size of the shadow below the app bar if shadowColor is not null If surfaceTintColor is not null then it will apply a surface tint overlay to the background color (see Material.surfaceTintColor for more detail).
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.settings),
        )
      ],
    );
  }

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(category.name, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList =
        CategoryOperations.getCategories(); //recieved all categories
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList(); //convert data into list of widgets..
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.only(top:10,right:12),
      child: Column(
        //we make it align to start so that song name and description comes at the start of the column
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: InkWell(
              onTap: (){
                _miniPlayer(music);
              },
              child: Image.network(
                music.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
         // SizedBox(),
          Text(music.name,style:TextStyle(color: Colors.white)),
          Text(music.description,style:TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    //itemBuilder creates a scrollable, linear array of widgets that are created on demand.This constructor is appropriate for list views with a large (or infinite) number of children because the builder is called only for those children that are actually visible.
    return Padding(
      padding: const EdgeInsets.only(left:15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return createMusic(musicList[index]);
                },
                itemCount: musicList.length),
          ),
        ],
      ),
    );
  }

  Widget createAppGrid() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: const EdgeInsets.only(bottom:20),
      height: 260,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //SafeArea widget Creates a widget that avoids operating system interfaces. The left, top, right, bottom, and minimum arguments must not be null.
    //SingleChildScrollView is used to Creates a box in which a single widget can be scrolled.
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        child: Column(
          children: [
            createAppBar("Good morning"),
            SizedBox(
              height: 5,
            ),
            createAppGrid(),
            createMusicList('Made for you'),
            createMusicList('Old hits'),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blueGrey.shade300,
          Colors.black,
          Colors.black,
          Colors.black
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      )),
    );
  }
}
