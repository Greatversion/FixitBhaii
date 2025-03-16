import 'package:carousel_slider/carousel_slider.dart';
import 'package:fixitbhai/utils/themes/app.dimensions.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HorizontalVideoList extends StatefulWidget {
  final List<String> videoUrls;

  const HorizontalVideoList({super.key, required this.videoUrls});

  @override
  State<HorizontalVideoList> createState() => _HorizontalVideoListState();
}

class _HorizontalVideoListState extends State<HorizontalVideoList> {
  int _currentIndex = 0; // Track the currently visible video
  late List<VideoPlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    // Initialize controllers for all videos
    _controllers = widget.videoUrls
        .map((url) => VideoPlayerController.asset(url)..initialize())
        .toList();

    // Automatically play the first video
    _controllers[_currentIndex].play();
  }

  @override
  void dispose() {
    // Dispose of all controllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      // Pause the current video
      _controllers[_currentIndex].pause();
      _currentIndex = index; // Update the index
      // Play the new current video
      _controllers[_currentIndex].play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: CarouselSlider.builder(
        itemCount: widget.videoUrls.length,
        itemBuilder: (context, index, realIndex) {
          return VideoCard(controller: _controllers[index]);
        },
        options: CarouselOptions(
          height: 400.0,
          onPageChanged: (index, reason) {
            _onPageChanged(index); // Handle video switching
          },
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: controller.value.isInitialized
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                  VideoProgressIndicator(controller, allowScrubbing: true),
                  IconButton(
                    icon: Icon(
                      controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    },
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
