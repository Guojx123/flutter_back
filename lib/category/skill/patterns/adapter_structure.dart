import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AdapterStructurePage extends StatefulWidget {
  @override
  _AdapterStructurePageState createState() => _AdapterStructurePageState();
}

class _AdapterStructurePageState extends State<AdapterStructurePage> {
  @override
  Widget build(BuildContext context) {

    Player player = Player();

    return Container(
      child: Column(
        children: [
          TitleWidget("适配器模式"),
          SubtitleWidget(''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    player.play("mp3", "青花瓷.mp3");
                  },
                  child: Text("播放音频（mp3）文件")),
              ElevatedButton(
                  onPressed: () {
                    player.play("avi", "mind me.avi");
                  },
                  child: Text("播放视频（mp4、avi）文件")),
            ],
          ),
        ],
      ),
    );
  }
}

//官方媒体播放接口
abstract class MediaPlayer {
  void play(String audioType, String fileName);
}

//自定义媒体播放接口
abstract class AdvancedMediaPlayer {
  void playAvi(String fileName);
  void playMp4(String fileName);
}

//创建实现了 AdvancedMediaPlayer 接口的实体类。
class VlcPlayer implements AdvancedMediaPlayer {
  @override
  void playMp4(String fileName) {}

  @override
  void playAvi(String fileName) {
    print("Playing avi file... Name: " + fileName);
  }
}

class Mp4Player implements AdvancedMediaPlayer {
  @override
  void playAvi(String fileName) {}

  @override
  void playMp4(String fileName) {
    print("Playing mp4 file... Name: " + fileName);
  }
}

// 创建实现了 MediaPlayer 接口的适配器类。
class MediaAdapter implements MediaPlayer {
  AdvancedMediaPlayer advancedMusicPlayer;
  MediaAdapter(String audioType) {
    if (audioType == "avi") {
      advancedMusicPlayer = new VlcPlayer();
    } else if (audioType == "mp4") {
      advancedMusicPlayer = new Mp4Player();
    }
  }
  @override
  void play(String audioType, String fileName) {
    if (audioType == "avi") {
      advancedMusicPlayer.playAvi(fileName);
    } else if (audioType == "mp4") {
      advancedMusicPlayer.playMp4(fileName);
    }
  }
}

// 创建实现了 MediaPlayer 接口的实体类。
class Player implements MediaPlayer {
  MediaAdapter mediaAdapter;

  @override
  void play(String audioType, String fileName) {
    //播放 mp3 音乐文件的内置支持
    if (audioType == "mp3") {
      print("Playing mp3 file... Name: " + fileName);
    }
    //mediaAdapter 提供了播放其他文件格式的支持
    else if (audioType == "avi" || audioType == "mp4") {
      mediaAdapter = new MediaAdapter(audioType);
      mediaAdapter.play(audioType, fileName);
    } else {
      print("Invalid media. " + audioType + " format not supported");
    }
  }
}
