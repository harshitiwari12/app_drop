import 'package:app_drop/model/component_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final ComponentModel model;
  const VideoComponent({super.key, required this.model});

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  VideoPlayerController? _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    final url = widget.model.getString('url') ?? '';
    final autoPlay = widget.model.getBool('autoPlay', false);
    final loop = widget.model.getBool('loop', false);

    if (url.isNotEmpty) {
      _controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {
            _initialized = true;
            if (autoPlay) _controller?.play();
            _controller?.setLooping(loop);
          });
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.model.getDouble('height', 200);

    if (_controller == null) {
      return Container(height: height, color: Colors.black12, child: const Center(child: Text('No video url')));
    }

    if (!_initialized) {
      return Container(height: height, color: Colors.black12, child: const Center(child: CircularProgressIndicator()));
    }

    return AspectRatio(
      aspectRatio: _controller!.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(_controller!),
          _ControlsOverlay(controller: _controller!),
          VideoProgressIndicator(_controller!, allowScrubbing: true),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  const _ControlsOverlay({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : Container(
              color: Colors.black26,
              child: const Center(child: Icon(Icons.play_arrow, size: 64, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
