import 'package:musico/models/music.dart';

class MusicOperations{
  MusicOperations._(){}
  static List<Music> getMusic(){
    return <Music>[
      Music('new song','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp-NHFYkczUEHoJcrMA_uomcuLI4yPcKVGxQ&usqp=CAU','This is nice music',''),
      Music('the song','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR1dkQ1KkLsTHyrv6TMS8b3ykoqiVK5ROcpg&usqp=CAU','nice music',''),
      Music('new song','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp-NHFYkczUEHoJcrMA_uomcuLI4yPcKVGxQ&usqp=CAU','This is nice music',''),
      Music('the song','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR1dkQ1KkLsTHyrv6TMS8b3ykoqiVK5ROcpg&usqp=CAU','nice music',''),
    ];
  }

}