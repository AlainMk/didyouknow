import 'package:didyouknow/theme/border_radius.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KnowunitySpacing.medium),
      decoration: BoxDecoration(
        color: KnowunityColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(KnowunityBorderRadius.huge),
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: KnowunityColors.white,
          borderRadius: BorderRadius.circular(KnowunityBorderRadius.huge),
        ),
        child: Row(
          children: [
            const Gap(KnowunitySpacing.medium),
            const Icon(CupertinoIcons.search),
            const Gap(KnowunitySpacing.smallMedium),
            Expanded(
              child: Text(
                'Search for more interesting facts',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: KnowunityColors.lightGray),
              ),
            ),
            const Gap(KnowunitySpacing.smallMedium),
            const Icon(CupertinoIcons.slider_horizontal_3),
            const Gap(KnowunitySpacing.medium),
          ],
        ),
      ),
    );
  }
}
