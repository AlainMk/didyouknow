import 'package:didyouknow/theme/border_radius.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SlidesFact extends StatefulWidget {
  const SlidesFact({super.key});

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
    if (_currentPage < 5 - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / 5,
            backgroundColor: KnowunityColors.white.withOpacity(0.5),
            valueColor: const AlwaysStoppedAnimation<Color>(KnowunityColors.white),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                //final slide = widget.details.slides[index];
                return _buildSlideContent();
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
                _currentPage < 5 - 1 ? 'Next' : 'Finish',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: KnowunityColors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(KnowunitySpacing.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(KnowunitySpacing.small),
          Text(
            "Did you know?",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: KnowunityColors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(KnowunitySpacing.large),
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              "https://picsum.photos/seed/200/300",
              fit: BoxFit.cover,
            ),
          ),
          const Gap(KnowunitySpacing.large),
          Text(
            "The first computer virus was created in 1983 and was called the Elk Cloner.",
            style: const TextStyle(fontSize: 16, color: KnowunityColors.white),
          ),
        ],
      ),
    );
  }
}
