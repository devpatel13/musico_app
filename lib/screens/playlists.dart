import 'package:flutter/material.dart';
import 'package:musico/models/playlist_model.dart';
import 'package:musico/widgets/section_header.dart';
import '../widgets/playlist_card.dart';
import '../widgets/section_header.dart';
import '../models/playlist_model.dart';
class PlayLists extends StatefulWidget {
  const PlayLists({Key? key}) : super(key: key);

  @override
  State<PlayLists> createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    children: [
    const SectionHeader(title: 'Playlists'),
    ListView.builder(
    shrinkWrap: true,
    padding: const EdgeInsets.only(top: 20),
    physics: const NeverScrollableScrollPhysics(),
    itemCount: Playlist.playlists.length,
    itemBuilder: ((context, index) {
    return PlaylistCard(playlist: Playlist.playlists[index]);
    }),
    ),
    ],
    ),
    ),
    );
  }
}
