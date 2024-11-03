import 'package:didyouknow/didyouknow/ui/details/bloc/details_fact_bloc.dart';
import 'package:didyouknow/theme/border_radius.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

class VideoFact extends StatefulWidget {
  const VideoFact({super.key, required this.item});
  final SlideItem item;

  @override
  State<VideoFact> createState() => _VideoFactState();
}

class _VideoFactState extends State<VideoFact> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.item.slideVideoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return SafeArea(
      child: Column(
        children: [
          const Gap(KnowunitySpacing.small),
          SizedBox(
            width: double.infinity,
            height: 220,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(KnowunitySpacing.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(KnowunitySpacing.large),
                  Text(
                    item.slideTitle,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: KnowunityColors.white),
                  ),
                  const Gap(KnowunitySpacing.large),
                  Text(
                    item.slideDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: KnowunityColors.white),
                  ),
                ],
              ),
            ),
          ),
          const Gap(KnowunitySpacing.large),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: KnowunitySpacing.large),
            width: double.infinity,
            child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: KnowunityColors.white,
              borderRadius: BorderRadius.circular(KnowunityBorderRadius.huge),
              child: Text(
                'Finish',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: KnowunityColors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
