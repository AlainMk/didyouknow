import 'package:didyouknow/theme/border_radius.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeFactCard extends StatelessWidget {
  const HomeFactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(KnowunitySpacing.largeL),
      margin: const EdgeInsets.symmetric(horizontal: KnowunitySpacing.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KnowunityBorderRadius.huge),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            KnowunityColors.primary.withOpacity(0.5),
            KnowunityColors.primary.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Did you know?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(KnowunitySpacing.normal),
          Text(
            'The first computer virus was created in 1983 and was called the Elk Cloner.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: KnowunityColors.grey),
            textAlign: TextAlign.center,
          ),
          const Gap(KnowunitySpacing.largeL),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: KnowunitySpacing.large),
              decoration: BoxDecoration(
                color: KnowunityColors.white,
                borderRadius: BorderRadius.circular(KnowunityBorderRadius.normal),
              ),
            ),
          ),
          const Gap(KnowunitySpacing.largeL),
          Row(
            children: [
              const Icon(CupertinoIcons.heart_fill, color: KnowunityColors.primary),
              const Gap(KnowunitySpacing.smallMedium),
              Text('12', style: Theme.of(context).textTheme.titleSmall),
              const Gap(KnowunitySpacing.largeXl),
              const Icon(CupertinoIcons.share, color: KnowunityColors.primary),
              const Spacer(),
              CupertinoButton(
                onPressed: () {},
                color: KnowunityColors.primary,
                padding: const EdgeInsets.symmetric(vertical: KnowunitySpacing.medium, horizontal: KnowunitySpacing.large),
                borderRadius: BorderRadius.circular(KnowunityBorderRadius.huge),
                child: Text(
                  "Learn More",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: KnowunityColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
