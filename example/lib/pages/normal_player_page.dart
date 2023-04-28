import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class NormalPlayerPage extends StatefulWidget {
  final String videoLink;

  const NormalPlayerPage({Key? key, required this.videoLink}) : super(key: key);
  @override
  _NormalPlayerPageState createState() => _NormalPlayerPageState();
}

class _NormalPlayerPageState extends State<NormalPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      autoPlay: false,
      autoDetectFullscreenAspectRatio: true,
      looping: true,
      handleLifecycle: true,
      autoDispose: false,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: false,
        enableFullscreen: false,
        enableMute: false,
        enableProgressText: false,
        enableProgressBar: false,
        enableProgressBarDrag: false,
        enablePlayPause: false,
        enableSkips: false,
        enableAudioTracks: false,
        enableRetry: false,
        enableSubtitles: false,
        showControlsOnInitialize: false,
      ),
    );
    final String extension = path.extension(widget.videoLink);
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoLink,
      videoExtension: extension == ".m3u8" ? "m3u8" : extension.substring(1),
      videoFormat: extension == ".m3u8" ? BetterPlayerVideoFormat.hls : null,
      liveStream: extension == ".m3u8" ? true : null,
      bufferingConfiguration: const BetterPlayerBufferingConfiguration(
        minBufferMs: 3000,
        bufferForPlaybackMs: 250,
        bufferForPlaybackAfterRebufferMs: 500,
        maxBufferMs: 3000,
      ),
      cacheConfiguration: extension != ".m3u8"
          ? null
          : BetterPlayerCacheConfiguration(
              useCache: true,
              key: widget.videoLink,
            ),
      useBufferForIos: 1,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal player page"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
