import 'package:cached_network_image/cached_network_image.dart';
import 'package:didyouknow/didyouknow/ui/details/bloc/details_fact_bloc.dart';
import 'package:didyouknow/theme/border_radius.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SlidesFact extends StatefulWidget {
  const SlidesFact({super.key, required this.items});

  final List<SlideItem> items;

  @override
  State<SlidesFact> createState() => _SlidesFactState();
}

class _SlidesFactState extends State<SlidesFact> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < widget.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    return SafeArea(
      child: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / items.length,
            backgroundColor: KnowunityColors.white.withOpacity(0.5),
            valueColor: const AlwaysStoppedAnimation<Color>(KnowunityColors.white),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return _buildSlideContent(item);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: KnowunitySpacing.large),
            width: double.infinity,
            child: CupertinoButton(
              onPressed: _goToNextPage,
              color: KnowunityColors.white,
              borderRadius: BorderRadius.circular(KnowunityBorderRadius.huge),
              child: Text(
                _currentPage < items.length - 1 ? 'Next' : 'Finish',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: KnowunityColors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideContent(SlideItem item) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(KnowunitySpacing.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(KnowunitySpacing.small),
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(KnowunityBorderRadius.big),
              image: DecorationImage(
                image: CachedNetworkImageProvider(item.slideImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
    );
  }
}
