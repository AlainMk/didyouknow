import 'package:cached_network_image/cached_network_image.dart';
import 'package:didyouknow/didyouknow/ui/details/bloc/details_fact_bloc.dart';
import 'package:didyouknow/theme/border_radius.dart';
import 'package:didyouknow/theme/colors.dart';
import 'package:didyouknow/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ArticleFact extends StatelessWidget {
  const ArticleFact({super.key, required this.item});

  final SlideItem item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(KnowunitySpacing.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(KnowunitySpacing.small),
                  Container(
                    width: double.infinity,
                    height: 200,
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
