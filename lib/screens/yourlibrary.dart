// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musico/screens/current_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

/*class Yourlibrary extends StatelessWidget {
  const Yourlibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SafeArea widget Creates a widget that avoids operating system interfaces. The left, top, right, bottom, and minimum arguments must not be null.
    return SafeArea(child: Text('Your library',style:TextStyle(fontSize:32,color: Colors.greenAccent)));
  }
}*/
class Yourlibrary extends StatefulWidget {
  const Yourlibrary({Key? key}) : super(key: key);

  @override
  State<Yourlibrary> createState() => _YourlibraryState();
}

class _YourlibraryState extends State<Yourlibrary> {
  final _audioQuery = new OnAudioQuery();
  //final _audioPlayer = new AudioPlayer();
  //final _audio=new AssetsAudioPlayer();
  // playSong(String? uri) {
  //   try {
  //     _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
  //     _audioPlayer.play();
  //   }on Exception{
  //     print('Error in playing song');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Local songs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true),
        builder: (context, item) {
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return Center(
                child: const Text(
              'No songs found',
              style: TextStyle(color: Colors.white),
            ));
          }
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              title: Text(
                item.data![index].displayNameWOExt,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                item.data![index].artist.toString(),
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.more_horiz, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>NowPlaying(songModel: item.data![index],)),
                );
                // _audio.open(
                //   Audio.file(item.data![index].uri.toString()),
                // );
                // _audio.play();
                //playSong(item.data![index].uri);
                // _audioPlayer.pause();
               },
            ),
            itemCount: item.data!.length,
          );
        },
      ),
    );
  }
}
